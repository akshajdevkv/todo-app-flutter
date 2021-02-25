import 'package:flutter/material.dart';
import '../models/data.dart';

class AddNewTaskDialog extends StatefulWidget {
  final Function addNewTask;
  final int taskNumber;

  AddNewTaskDialog({this.addNewTask, this.taskNumber});

  @override
  _AddNewTaskDialogState createState() => _AddNewTaskDialogState();
}

class _AddNewTaskDialogState extends State<AddNewTaskDialog> {
  TextEditingController taskName = TextEditingController();
  int priority = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.width / 2) + 200,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: TextField(
              controller: taskName,
              autofocus: true,
              decoration: new InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  labelText: "Add Task"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  child: Row(
                children: [
                  IconButton(
                    tooltip: "P1",
                    splashColor: Colors.red,
                    splashRadius: 18,
                    onPressed: () {
                      priority = 1;
                      print("p1");
                    },
                    icon: Icon(
                      Icons.circle,
                      size: 30,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    tooltip: "P2",
                    splashColor: Colors.orange[400],
                    splashRadius: 18,
                    onPressed: () {
                      priority = 2;
                      print("p2");
                    },
                    icon: Icon(
                      Icons.circle,
                      size: 30,
                      color: Colors.orange[400],
                    ),
                  ),
                  IconButton(
                    tooltip: "P3",
                    splashColor: Colors.blue,
                    splashRadius: 18,
                    onPressed: () {
                      priority = 3;
                      print("p3");
                    },
                    icon: Icon(
                      Icons.circle,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                  IconButton(
                    tooltip: "P4",
                    splashColor: Colors.grey,
                    splashRadius: 18,
                    onPressed: () {
                      priority = 4;
                      print("p3");
                    },
                    icon: Icon(
                      Icons.circle,
                      size: 30,
                      color: Colors.grey,
                    ),
                  )
                ],
              )),
              FlatButton(
                disabledTextColor: Colors.grey,
                textColor: Theme.of(context).accentColor,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                onPressed: () {
                  if (taskName.text.isNotEmpty) {
                    print(taskName.text);
                    Task task = Task(
                        title: taskName.text,
                        taskId: widget.taskNumber,
                        priority: priority);

                    widget.addNewTask(task);

                    taskName.clear();

                    Navigator.of(context).pop();
                  } else {
                    print("Task Name is empty");
                  }
                },
                child: Text(
                  "Save",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
