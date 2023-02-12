import 'package:flutter/material.dart';

class BlockQuote extends StatefulWidget {
  const BlockQuote({
    super.key,
    this.parent,
    this.children,
  });

  final String? parent;
  final List<Widget>? children;

  @override
  State<BlockQuote> createState() => _BlockQuoteState();
}

class _BlockQuoteState extends State<BlockQuote> {
  @override
  Widget build(BuildContext context) {
    final children = [];
    if (widget.parent != null && widget.parent!.trim().isNotEmpty) {
      children.add(Text(widget.parent ?? ''));
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      // margin: const EdgeInsets.only(top: 6),
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
