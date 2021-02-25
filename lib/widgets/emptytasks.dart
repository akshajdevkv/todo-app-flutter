import 'package:flutter/material.dart';

class EmptyTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/taskfinished.png',
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "All Done !",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                fontFamily: 'RockSalt',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
