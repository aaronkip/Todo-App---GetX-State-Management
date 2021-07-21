import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/pages/pages.dart';

import 'controllers/todo_controller.dart';

void main() {
  Get.put(TodoController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
