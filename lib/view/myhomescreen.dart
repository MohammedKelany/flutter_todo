import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/controller/sum_controller.dart';
import 'package:new_app/view/widgets/button.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQF"),
        centerTitle: true,
      ),
      body: Center(
        child: GetX<MyController>(
            init: MyController(),
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${controller.counter1.value}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    "${controller.counter2.value}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    "${controller.sumsSum()}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        text: "Counter1",
                        onTap: () {
                          controller.increase1();
                        },
                        color: Colors.blue,
                      ),
                      CustomButton(
                        text: "Counter2",
                        onTap: () {
                          controller.increase2();
                        },
                        color: Colors.blue,
                      ),
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }
}
