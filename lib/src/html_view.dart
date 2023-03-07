import 'package:flutter/material.dart';

class HTMLView extends StatefulWidget {
  const HTMLView({super.key, required this.source});

  final String source;

  @override
  State<HTMLView> createState() => _HTMLViewState();
}

class _HTMLViewState extends State<HTMLView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Text(widget.source),
      ),
    );
  }
}
