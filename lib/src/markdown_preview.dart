import 'package:bleck_markdown/src/css_utils.dart';
import 'package:bleck_markdown/src/markdown.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/nord.dart';
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            return Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              width: double.infinity,
              child: HighlightView(
                code.trim(),
                language: codeLang,
                padding: const EdgeInsets.all(12),
                tabSize: 2,
                theme: widget.codeTheme ?? nordTheme,
                textStyle: const TextStyle(fontFamily: 'monospace'),
              ),
            );
          },
          'code': (context, child) {
            final TextContentElement codeElement =
                context.tree.children.first as TextContentElement;
            return Container(
              padding: EdgeInsets.symmetric(
                  vertical: emToPx(0.2), horizontal: emToPx(0.4)),
              margin: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(31, 175, 184, 193),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                codeElement.text ?? '',
                style: const TextStyle(fontFamily: 'monospace'),
              ),
            );
          },
          'input': (context, child) {
            return null;
          },
          'li': (context, child) {
            List<StyledElement> children = context.tree.children;
            if (children.length == 1) {
              return null;
            }
            StyledElement checkboxElement = children.first;
            TextContentElement textContentElement =
                children.last as TextContentElement;
            String title = textContentElement.text ?? '';
            return ListTile(
              leading: Checkbox(
                value: checkboxElement.attributes['checked'] == 'true',
                onChanged: null,
              ),
              title: Text(title),
            );
          },
        },
      ),
    );
  }
}
