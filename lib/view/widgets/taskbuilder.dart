import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/controller/to_do_app_controller.dart';
import 'package:new_app/model/TaskModel.dart';
import 'package:new_app/view/widgets/customtext.dart';

class TaskBuilder extends StatelessWidget {
  const TaskBuilder({
    Key? key,
    required this.model,
  }) : super(key: key);
  final TaskModel model;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ToDoAppController>(
        init: ToDoAppController(),
        builder: (controller) {
          return Dismissible(
            key: Key(model.id.toString()),
            onDismissed: (index) {
              controller.deleteData(id: model.id);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.lightBlue,
                    child: CustomText(
                        color: Colors.white, text: model.taskTime, size: 17 ,maxLines: 1,),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                            color: Colors.black, text: model.taskName, size: 17,maxLines: 1,),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText(
                            color: Colors.grey, text: model.taskDate, size: 13,maxLines: 1,),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        controller.updateData(status: "done", id: model.id);
                      },
                      icon:const Icon(Icons.done),
                      color: Colors.blueAccent),
                  IconButton(
                    onPressed: () {
                      controller.updateData(status: "archived", id: model.id);
                    },
                    icon:const Icon(Icons.archive_outlined),
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
