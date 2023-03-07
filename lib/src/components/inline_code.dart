import 'package:bleck_markdown/src/css_utils.dart';
import 'package:flutter/material.dart';

class InlineCode extends StatelessWidget {
  const InlineCode(String text, {super.key}) : source = text;

  final String source;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(175, 184, 193, 0.12),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      padding: EdgeInsets.symmetric(
        vertical: emToPx(0.2),
        horizontal: emToPx(0.4),
      ),
      margin: const EdgeInsets.all(0),
      child: Text(
        source,
        style: const TextStyle(
          fontFamily: 'consolas',
          color: Colors.redAccent,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
