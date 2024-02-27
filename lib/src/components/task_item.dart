import 'package:flutter/material.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({
    super.key,
    this.title = '',
    this.checked = false,
  });

  final bool checked;
  final String title;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: widget.checked,
          onChanged: null,
        ),
        Text(widget.title),
      ],
    );
  }
}
