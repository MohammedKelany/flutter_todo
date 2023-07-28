import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/view/to_do_app_view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home:ToDoHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
