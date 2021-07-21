import 'package:get/get.dart';

class TodoController extends GetxController {
  final notes = <String, String>{}.obs;
  get getNotes => notes;

  @override
  void onInit() {

    super.onInit();
  }

  addNote(String title, String desc) {
    Map<String, String> map = {title: desc};
    notes.addAll(map);
  }

  deleteNote(String title) {
    notes.remove(title);
  }
}
