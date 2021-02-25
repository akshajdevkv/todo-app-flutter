import 'package:flutter/material.dart';
import '../models/data.dart';

class CompletedTask extends StatelessWidget {
  final String title;
  final int taskId;
  final Function incompleteTask;
  CompletedTask({this.taskId, this.title, this.incompleteTask});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: IconButton(
          onPressed: () {
            incompleteTask(Task(title: title, taskId: taskId), taskId);
          },
          icon: Stack(
            fit: StackFit.expand,
            children: [
              Icon(
                Icons.panorama_fish_eye_outlined,
                size: 27,
                color: Colors.grey[900],
              ),
              Icon(
                Icons.check_circle,
                size: 23,
                color: Theme.of(context).accentColor,
              ),
            ],
          ),
        ),
        title: Text(
          "$title",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        dense: true,
        enabled: false,
        onTap: () {},
      ),
    );
  }
}
