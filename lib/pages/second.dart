import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controllers/todo_controller.dart';

class SecondPage extends StatelessWidget {
  final TodoController controller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back),
          ),
          actions: [
            GestureDetector(
              onTap: (){
                controller.deleteNote('');
              },
              child: Icon(Icons.delete),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                      itemCount: controller.notes.length,
                      itemBuilder: (context, index) {
                        MapEntry toDoEntry = controller.notes.entries.elementAt(
                            index);
                        return Container(
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    toDoEntry.key,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    toDoEntry.value,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
