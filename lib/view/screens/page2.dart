import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/controller/to_do_app_controller.dart';

import '../../model/TaskModel.dart';
import '../widgets/separator.dart';
import '../widgets/taskbuilder.dart';
import 'emptyscreen.dart';

class Done extends StatelessWidget {
  Done({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ToDoAppController>(
      init: ToDoAppController(),
      builder: (controller){
        return controller.doneTasks.isEmpty ? EmptyTask() : ListView.separated(
          itemBuilder: (context, index) {
            return TaskBuilder(
              model: TaskModel(
                  controller.doneTasks[index]["name"],
                  controller.doneTasks[index]["time"],
                  controller.doneTasks[index]["date"],
                  controller.doneTasks[index]["id"]),
            );
          },
          separatorBuilder: (context, index) {
            return const Separator();
          },
          itemCount: controller.doneTasks.length,
          physics: const BouncingScrollPhysics(),
        );
      },
    );
  }
}
