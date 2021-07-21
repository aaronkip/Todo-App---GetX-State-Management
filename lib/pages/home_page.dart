import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controllers/todo_controller.dart';
import 'package:untitled/pages/second.dart';

class HomePage extends StatelessWidget {
  final TodoController controller = Get.find<TodoController>();
  final TextEditingController titleEditingController = TextEditingController();
  final TextEditingController itemEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onTap: () {
              Get.to(SecondPage());
            },
            child: Text('Todo App'),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                controller.deleteNote(titleEditingController.text);
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
              TextField(
                decoration: InputDecoration(hintText: 'Title here'),
                controller: titleEditingController,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Todo description'),
                controller: itemEditingController,
              ),
              SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  controller.addNote(
                      titleEditingController.text, itemEditingController.text);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.blue),
                ),
                child: Icon(Icons.add, color: Colors.white),
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                      itemCount: controller.notes.length,
                      itemBuilder: (context, index) {
                        MapEntry toDoEntry =
                            controller.notes.entries.elementAt(index);
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
