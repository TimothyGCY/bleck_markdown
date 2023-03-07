import 'package:bleck_markdown/src/components/blockquote.dart';
import 'package:bleck_markdown/src/components/code_block.dart';
import 'package:bleck_markdown/src/components/inline_code.dart';
import 'package:bleck_markdown/src/components/task_item.dart';
import 'package:bleck_markdown/src/markdown.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:markdown/markdown.dart' hide Text;

class MarkdownPreview extends StatefulWidget {
  const MarkdownPreview({
    super.key,
    required this.data,
    this.codeTheme,
  });

  /// Input string
  final String data;
  final Map<String, TextStyle>? codeTheme;

  @override
  State<MarkdownPreview> createState() => _MarkdownPreviewState();
}

class _MarkdownPreviewState extends State<MarkdownPreview> {
  String _parseToMarkdown(String data) {
    String html = markdownToHtml(
      data,
      extensionSet: ExtensionSet.gitHubFlavored,
      encodeHtml: false,
    );

    return html;
  }

  Widget? _createNewBlockquote(List<StyledElement> elements) {
    Widget? parent;
    List<Widget> body = [];

    List<StyledElement> filteredElements = [];
    for (StyledElement element in elements) {
      if (element.runtimeType.toString() == 'StyledElement') {
        filteredElements.add(element);
      }
    }

    final firstChildren = filteredElements.first.children;
    if (firstChildren.length == 1) {
      if (firstChildren.first.runtimeType.toString() == 'TextContentElement') {
        String? title = (firstChildren.first as TextContentElement).text;
        if (title != null) parent = Text(title);
      }
    } else {
      body.add(_createNewBlockquote(firstChildren)!);
    }

    for (int i = 1; i < filteredElements.length; i++) {
      body.add(_createNewBlockquote(filteredElements[i].children)!);
    }

    return BlockQuote(
      parent: parent,
      children: body,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Html(
          data: _parseToMarkdown(widget.data),
          tagsList: Html.tags..addAll(['input']),
          style: markdownStyle,
          customRender: {
            'pre': (context, child) {
              StyledElement codeElement = context.tree.children.first;
              String codeLang = codeElement.elementClasses.first.substring(9);
              TextContentElement codeContentElement =
                  codeElement.children.first as TextContentElement;
              String code = codeContentElement.text ?? '';
              return CodeBlock(
                code: code,
                language: codeLang,
              );
            },
            'code': (context, child) {
              final TextContentElement codeElement =
                  context.tree.children.first as TextContentElement;
              return InlineCode(codeElement.text ?? '');
            },
            'input': (context, child) {
              return const SizedBox();
            },
            'li': (context, child) {
              try {
                List<StyledElement> children = context.tree.children;
                StyledElement firstElement = children.first;
                if (firstElement.attributes['type'] == 'checkbox') {
                  if (children.length == 1) {
                    return TaskItem(
                      checked: firstElement.attributes['checked'] == 'true',
                    );
                  }

                  TextContentElement textContentElement =
                      children.last as TextContentElement;
                  String title = textContentElement.text ?? '';
                  return TaskItem(
                    title: title,
                    checked: firstElement.attributes['checked'] == 'true',
                  );
                }
                return null;
              } catch (e) {
                return null;
              }
            },
            'blockquote': (context, child) {
              try {
                List<StyledElement> blockquoteElements = context.tree.children;
                return _createNewBlockquote(blockquoteElements);
              } catch (e) {
                return const SizedBox();
              }
            },
          },
        ),
      ),
    );
  }
}
