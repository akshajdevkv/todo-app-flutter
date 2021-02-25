import 'package:flutter/material.dart';
import '../models/data.dart';
import '../widgets/taskWidget.dart';

class IncompleteTasks extends StatelessWidget {
  final List<Task> myTasks;
  final Function completeTask;
  IncompleteTasks({this.completeTask, this.myTasks});
  @override
  Widget build(BuildContext context) {
    myTasks.sort((a, b) => a.priority.compareTo(b.priority));
    return Container(
      child: Column(
        children: myTasks
            .map((task) => TaskWidget(
                  priority: task.priority,
                  title: task.title,
                  taskId: task.taskId,
                  completeTask: completeTask,
                ))
            .toList(),
      ),
    );
  }
}
