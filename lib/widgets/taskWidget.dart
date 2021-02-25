import 'package:flutter/material.dart';

import '../models/data.dart';

class TaskWidget extends StatelessWidget {
  final List<Color> priorityColors = [
    Colors.red,
    Colors.orange,
    Colors.blue,
    Colors.grey[900],
  ];
  final priority;
  final String title;
  final int taskId;
  final Function completeTask;
  TaskWidget(
      {@required this.priority, this.taskId, this.title, this.completeTask});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: IconButton(
          onPressed: () {
            completeTask(Task(title: title, taskId: taskId), taskId);
          },
          icon: Icon(
            Icons.panorama_fish_eye,
            size: 25,
            color: priorityColors[priority - 1],
          ),
        ),
        title: Text(
          "$title",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        dense: false,
        enabled: true,
        onTap: () {},
      ),
    );
  }
}
