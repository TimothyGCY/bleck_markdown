import 'package:flutter/material.dart';

class ListGroup extends StatefulWidget {
  const ListGroup({
    super.key,
    this.parent,
    this.children = const [],
  });

  final Widget? parent;
  final List<Widget> children;

  @override
  State<ListGroup> createState() => _ListGroupState();
}

class _ListGroupState extends State<ListGroup> {
  @override
  Widget build(BuildContext context) {
    final children = [];
    if (widget.parent != null) {
      children.add(widget.parent);
    }

    if (widget.children.isNotEmpty) {
      children.addAll(widget.children);
    }

    return Container(
      padding: const EdgeInsets.only(left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [...children],
      ),
    );
  }
}
