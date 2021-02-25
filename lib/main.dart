import 'package:flutter/material.dart';
import './widgets/addNewTask.dart';
import './widgets/emptytasks.dart';
import './widgets/completedTasks.dart';
import './widgets/incompleteTasks.dart';
import 'models/data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.blue,
        backgroundColor: Colors.white,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Task> completedTasks = [];
  int taskNumber = 0;
  List<Task> myTasks = [
    Task(title: "Task 1", taskId: 0, priority: 1),
  ];

  void addNewTask(Task task) {
    setState(() {
      myTasks.add(task);
      taskNumber += 1;
    });
  }

  void clearCompletedTasks() {
    setState(() {
      completedTasks.clear();
    });
  }

  void completeTask(Task task, int taskId) {
    setState(() {
      completedTasks.add(task);
      myTasks.removeWhere((task) => task.taskId == taskId);
      for (Task i in myTasks) {
        print('${i.title} - ${i.taskId} \n');
      }
    });
  }

  void incompleteTask(Task task, int taskId) {
    setState(() {
      myTasks.add(task);
      completedTasks.removeWhere((task) => task.taskId == taskId);
    });
  }

  Widget taskListName(String taskListName) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 30),
      child: Text(
        taskListName,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 40,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        children: [
          taskListName('My Tasks'),
          myTasks.isNotEmpty
              ? Column(
                  children: [
                    IncompleteTasks(
                      completeTask: completeTask,
                      myTasks: myTasks,
                    ),
                    completedTasks.isNotEmpty
                        ? CompletedTasks(
                            completedTasks: completedTasks,
                            incompleteTask: incompleteTask,
                            clearCompletedTasks: clearCompletedTasks,
                          )
                        : Container()
                  ],
                )
              : EmptyTasks()
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add a new task',
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              context: context,
              builder: (_) {
                return AddNewTaskDialog(
                  addNewTask: addNewTask,
                  taskNumber: taskNumber,
                );
              });
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
