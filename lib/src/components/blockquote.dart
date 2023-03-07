import 'package:flutter/material.dart';

class BlockQuote extends StatefulWidget {
  const BlockQuote({
    super.key,
    this.parent,
    this.children,
  });

  final Widget? parent;
  final List<Widget>? children;

  @override
  State<BlockQuote> createState() => _BlockQuoteState();
}

class _BlockQuoteState extends State<BlockQuote> {
  @override
  Widget build(BuildContext context) {
    final children = [];
    if (widget.parent != null) {
      children.add(widget.parent);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 4,
            color: Color(0xFFD3D3D3),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...children,
          ...widget.children ?? [],
        ],
      ),
    );
  }
}
