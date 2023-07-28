import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/controller/to_do_app_controller.dart';
import 'package:new_app/model/TaskModel.dart';
import 'package:new_app/view/screens/page4.dart';
import 'package:new_app/view/widgets/separator.dart';
import 'package:new_app/view/widgets/taskbuilder.dart';

import 'emptyscreen.dart';

class New extends StatelessWidget {
  New({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ToDoAppController>(
      init: ToDoAppController(),
      builder: (controller) => controller.newTasks.isEmpty
          ? const EmptyTask()
          : ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      PageFour(
                        taskModel: TaskModel(
                            controller.newTasks[index]["name"],
                            controller.newTasks[index]["time"],
                            controller.newTasks[index]["date"],
                            controller.newTasks[index]["id"]),
                      ),
                    );
                  },
                  child: TaskBuilder(
                    model: TaskModel(
                        controller.newTasks[index]["name"],
                        controller.newTasks[index]["time"],
                        controller.newTasks[index]["date"],
                        controller.newTasks[index]["id"]),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Separator();
              },
              itemCount: controller.newTasks.length,
              physics: const BouncingScrollPhysics(),
            ),
    );
  }
}
