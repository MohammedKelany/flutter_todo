import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/view/screens/page1.dart';
import 'package:new_app/view/screens/page2.dart';
import 'package:new_app/view/screens/page3.dart';
import 'package:new_app/view/screens/page4.dart';
import 'package:new_app/view/widgets/button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                color: Colors.blue,
                onTap: () {
                  Get.to(New());
                },
                text: 'page1'),
            CustomButton(
                color: Colors.blue,
                onTap: () {
                  Get.to(Done());
                },
                text: 'page2'),
            CustomButton(
                color: Colors.blue,
                onTap: () {
                  Get.to(Archived());
                },
                text: 'page3'),
          ],
        ),
      ),
    );
  }
}
