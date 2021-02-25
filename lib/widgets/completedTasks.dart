import 'package:flutter/material.dart';
import '../models/data.dart';
import '../widgets/completedTask.dart';

class CompletedTasks extends StatelessWidget {
  final List<Task> completedTasks;
  final Function incompleteTask;
  final Function clearCompletedTasks;
  CompletedTasks(
      {this.completedTasks, this.incompleteTask, this.clearCompletedTasks});
  void showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      elevation: 24,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: EdgeInsets.all(0),
      title: Text("Delete all Completed Tasks"),
      actions: [
        FlatButton(
          textColor: Theme.of(context).accentColor,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Cancel"),
        ),
        FlatButton(
          textColor: Theme.of(context).accentColor,
          onPressed: () {
            clearCompletedTasks();
            Navigator.of(context).pop();
          },
          child: Text("Delete"),
        )
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showAlertDialog(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                child: Text(
                  "Completed Tasks(${completedTasks.length})",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: completedTasks.map((completedtask) {
                    return CompletedTask(
                      title: completedtask.title,
                      taskId: completedtask.taskId,
                      incompleteTask: incompleteTask,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
