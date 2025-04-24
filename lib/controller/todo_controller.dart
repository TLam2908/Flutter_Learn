import 'package:get/get.dart';
import 'dart:collection';

import 'package:shared_preferences/shared_preferences.dart';

class todoController extends GetxController {
  final RxList<String> _todoList = <String>[].obs;

  UnmodifiableListView<String> get todoList =>
      UnmodifiableListView(_todoList);

  final RxString todoTitle = ''.obs;

  SharedPreferences? prefs;

  @override
  void onInit() async {
    super.onInit();
    initPreferences();
  }

  void initPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    todoTitle.value = prefs.getString("todoTitle") ?? "";
  }

  void saveTodoReference (String title) async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
    todoTitle.value = title;
    await prefs?.setString("todoTitle", title);
  }

  String getTodoReference () {
    String? todoTitle = prefs?.getString("todoTitle");
    return todoTitle ?? "";
  }

  void addTodo(String todo) {
    _todoList.add(todo);
  }

  void removeTodo(int index) {
    _todoList.removeAt(index);
  }

  void clearTodos() {
    _todoList.clear();
  }

  void updateTodo(int index, String todo) {
    _todoList[index] = todo;
  }
}
