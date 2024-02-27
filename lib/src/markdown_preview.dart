import 'dart:developer';

import 'package:bleck_markdown/src/components/blockquote.dart';
import 'package:bleck_markdown/src/components/code_block.dart';
import 'package:bleck_markdown/src/components/inline_code.dart';
import 'package:bleck_markdown/src/components/list_group.dart';
import 'package:bleck_markdown/src/components/task_item.dart';
import 'package:bleck_markdown/src/markdown.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as html;
import 'package:markdown/markdown.dart' hide Text;
import 'package:url_launcher/url_launcher_string.dart';

class MarkdownPreview extends StatefulWidget {
  /// Input string
  final String data;

  final Map<String, TextStyle>? codeTheme;
  const MarkdownPreview({
    super.key,
    required this.data,
    this.codeTheme,
  });

  @override
  State<MarkdownPreview> createState() => _MarkdownPreviewState();
}

class _MarkdownPreviewState extends State<MarkdownPreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Html(
          data: _parseToMarkdown(widget.data),
          // tagsList: Html.tags..addAll(['input']),
          style: markdownStyle,
          onLinkTap: (url, renderContext, _) async {
            if (await canLaunchUrlString(url!)) {
              launchUrlString(url);
            }
          },
          extensions: [
            TagExtension(
                tagsToExtend: {'pre'},
                builder: (extensionContext) {
                  String defaultCodeLang = 'txt';
                  List<html.Element> codeElement =
                      extensionContext.elementChildren;
                  if (codeElement.isEmpty) {
                    return const CodeBlock(code: '');
                  }

                  final html.Element codeFirstElem = codeElement.first;
                  String codeLang =
                      codeFirstElem.attributes['class']?.substring(9) ??
                          defaultCodeLang;
                  String code = '';
                  if (codeFirstElem.nodes.isNotEmpty) {
                    code = codeFirstElem.nodes.first.text ?? '';
                  }
                  return CodeBlock(language: codeLang, code: code);
                }),
            TagExtension(
                tagsToExtend: {'code'},
                builder: (extensionContext) {
                  inspect(extensionContext);
                  final node = extensionContext.node;
                  if (node.nodes.isEmpty) {
                    return const InlineCode('');
                  }
                  return InlineCode(node.nodes.first.text ?? '');
                }),
            // 'input': (context, child) {
            //   return const SizedBox();
            // },
            // 'li': (context, child) {
            //   List<StyledElement> children = context.tree.children;
            //   return _createTaskList(children);
            // },

            TagExtension(
              tagsToExtend: {'blockquote'},
              builder: (extensionContext) {
                StyledElement? styledElement = extensionContext.styledElement;
                if (styledElement != null) {
                  return _createNewBlockquote(styledElement.children) ??
                      Container();
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget? _createNewBlockquote(List<StyledElement> elements) {
    Widget? parent;
    List<Widget> body = [];

    if (elements.isEmpty) return Container();

    final List<StyledElement> firstChildren = elements.first.children;

    if (firstChildren.isEmpty) return Container();

    inspect(elements);

    if (firstChildren.first is TextContentElement) {
      String? title = (firstChildren.first as TextContentElement).text;
      if (title != null) parent = Text(title);
    }

    if (elements.length > 1) {
      for (final el in elements) {
        body.add(_createNewBlockquote(el.children) ?? Container());
      }
    }

    return BlockQuote(
      parent: parent,
      children: body,
    );
  }

  Widget? _createTaskList(List<StyledElement> elements) {
    Widget? parent;
    List<Widget> body = [];

    if (elements.isNotEmpty) {
      StyledElement firstNode = elements.first;
      if (firstNode.attributes['type'] != 'checkbox') return null;
      bool checked = firstNode.attributes['checked'] == 'true';
      if (elements.length == 1) {
        parent = TaskItem(checked: checked);
      } else {
        dynamic textContentElement;

        try {
          textContentElement = elements.elementAt(1) as TextContentElement;
        } catch (e) {
          textContentElement = elements.elementAt(1);
          return _createTaskList(textContentElement.children);
        }

        String title = textContentElement.text ?? '';

        parent = TaskItem(
          checked: checked,
          title: title,
        );

        if (elements.length > 2) {
          List<StyledElement> subChildren = elements.elementAt(2).children;
          for (StyledElement e in subChildren) {
            body.add(_createTaskList(e.children) ?? const Text('blanked'));
          }
        }
      }
      return ListGroup(
        parent: parent,
        children: body,
      );
    }

    return null;
  }

  String _parseToMarkdown(String data) {
    String html = markdownToHtml(
      data,
      extensionSet: ExtensionSet.gitHubFlavored,
      encodeHtml: true,
    );

    return html;
  }
}
