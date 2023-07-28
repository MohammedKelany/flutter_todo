import 'package:flutter/material.dart';
import 'package:new_app/model/TaskModel.dart';
class PageFour extends StatelessWidget {
  const PageFour({Key? key, required this.taskModel}) : super(key: key);
 final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              "Task name is: ${taskModel.taskName}",
            ),
            Text(
              "Task time is: ${taskModel.taskTime}",
            ), Text(
              "Task date is: ${taskModel.taskDate}",
            ),
          ],
        ),
      ),
    );
  }
}
