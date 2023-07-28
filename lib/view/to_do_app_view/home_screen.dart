import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/controller/to_do_app_controller.dart';
import 'package:new_app/view/widgets/customtextform.dart';

class ToDoHomeScreen extends StatelessWidget {
  ToDoHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ToDoAppController>(
        init: ToDoAppController()..createDB(),
        builder: (controller) {
          return Scaffold(
            key: controller.scaffoldKey,
            appBar: AppBar(
              title: const Text('ToDo Application'),
              centerTitle: true,
            ),
            body: controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.screens[controller.currentIndex],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (controller.isBottomSheetOpened) {
                  if (controller.formKey.currentState!.validate()) {
                    controller.insertData(
                        name: controller.taskController.text,
                        time: controller.timeController.text,
                        date: controller.dateController.text);
                    Get.back();
                    controller.taskController.text = '';
                    controller.timeController.text = '';
                    controller.dateController.text = '';
                  }
                } else {
                  controller.iconChange();
                  controller.scaffoldKey.currentState!
                      .showBottomSheet(
                        (context) => SingleChildScrollView(
                          child: Form(
                            key: controller.formKey,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomFormField(
                                    validationString: "Task should be written",
                                    labelText: "Task",
                                    icon: const Icon(Icons.task),
                                    control: controller.taskController,
                                    onTap: () {},
                                  ),
                                  CustomFormField(
                                      onTap: () {
                                        showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        ).then((value) {
                                          controller.timeController.text =
                                              value!.format(context);
                                        });
                                      },
                                      validationString:
                                          "Time should be written",
                                      labelText: "Time",
                                      icon: const Icon(
                                          Icons.watch_later_outlined),
                                      control: controller.timeController),
                                  CustomFormField(
                                      onTap: () {
                                        showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.now(),
                                                lastDate: DateTime.parse(
                                                    "2022-08-20"))
                                            .then((value) {
                                          controller.dateController.text = value
                                              .toString()
                                              .replaceAll('000', '')
                                              .replaceAll('00', '')
                                              .replaceAll(':', '')
                                              .replaceAll('.', '')
                                              .replaceAll('-', '/');
                                        });
                                      },
                                      validationString:
                                          "Date should be written",
                                      labelText: "Date",
                                      icon: const Icon(Icons.calendar_month),
                                      control: controller.dateController),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .closed
                      .then((value) {
                    controller.iconChange();
                  });
                }
              },
              child: controller.isBottomSheetOpened
                  ? const Icon(Icons.add)
                  : const Icon(Icons.edit),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.new_releases), label: "new"),
                BottomNavigationBarItem(icon: Icon(Icons.done), label: 'done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive), label: 'archived'),
              ],
              onTap: (index) {
                controller.changeBottomIndex(index);
              },
            ),
          );
        });
  }
}
