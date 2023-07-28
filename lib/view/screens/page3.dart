import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/controller/to_do_app_controller.dart';

import '../../model/TaskModel.dart';
import '../widgets/separator.dart';
import '../widgets/taskbuilder.dart';
import 'emptyscreen.dart';

class Archived extends StatelessWidget {
  Archived({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ToDoAppController>(
        init: ToDoAppController(),
        builder: (controller) {
          return controller.archivedTasks.isEmpty
              ? EmptyTask()
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return TaskBuilder(
                      model: TaskModel(
                          controller.archivedTasks[index]["name"],
                          controller.archivedTasks[index]["time"],
                          controller.archivedTasks[index]["date"],
                          controller.archivedTasks[index]["id"]),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Separator();
                  },
                  itemCount: controller.archivedTasks.length,
                  physics: const BouncingScrollPhysics(),
                );
        });
  }
}
