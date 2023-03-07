import 'package:bleck_markdown/bleck_markdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/nord.dart';

class CodeBlock extends StatefulWidget {
  const CodeBlock({
    super.key,
    required this.code,
    this.language,
    this.tabSize = 4,
    this.theme = nordTheme,
  });

  final String code;
  final String? language;
  final int tabSize;

  /// Theme options from [flutter_highlight]
  final Map<String, TextStyle> theme;

  @override
  State<CodeBlock> createState() => _CodeBlockState();
}

class _CodeBlockState extends State<CodeBlock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      width: double.infinity,
      child: HighlightView(
        widget.code,
        language: widget.language,
        padding: const EdgeInsets.only(top: 16, right: 12, bottom: 0, left: 12),
        tabSize: widget.tabSize,
        theme: widget.theme,
        textStyle: const TextStyle(fontFamily: 'monospace'),
      ),
    );
  }
}
