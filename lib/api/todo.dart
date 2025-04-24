import 'dart:convert';
import 'package:http/http.dart' as http;
import '/models/todo.dart';

class TodoResponse {
  final String message;
  final Todo todo;

  TodoResponse(this.todo, this.message);
}

class TodoListResponse {
  final String message;
  final List<Todo> todos;
  
  TodoListResponse(this.todos, this.message);
}

class TodoApi {
  final String baseUrl = "http://10.0.2.2:3000/todos";

  Map<String, String> get headers => {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  // tham so la class
  Future<TodoResponse> createTodo(Todo todo) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl"),
        headers: headers,
        body: jsonEncode(todo),
      );
      final responseTodo = jsonDecode(response.body);
      print("responseTodo: $responseTodo");
      
      final createdTodo = Todo.fromJson(responseTodo['todo']);
      final message = responseTodo['message'];
      
      return TodoResponse(createdTodo, message);
    } catch (error) {
      print("Error: $error");
      throw Exception('Failed to create todo');
    }
  }
  
  Future<TodoListResponse> getTodos() async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl"),
        headers: headers,
      );
      final responseTodos = jsonDecode(response.body);
      print("responseTodos: $responseTodos");

      List<Todo> todos = [];
      for (var todo in responseTodos['todos']) {
        todos.add(Todo.fromJson(todo));
      }
      final message = responseTodos['message'];

      return TodoListResponse(todos, message);
    } catch (error) {
      print("Error: $error");
      throw Exception('Failed to fetch todos');
    }
  }

  Future<TodoResponse> deleteTodo(int id) async {
    try {
      final response = await http.delete(
        Uri.parse("$baseUrl/$id"),
        headers: headers,
      );
      final responseTodo = jsonDecode(response.body);
      print("responseTodo: $responseTodo");

      final todo = Todo.fromJson(responseTodo['todo']);
      final message = responseTodo['message'];

      return TodoResponse(todo, message);
    } catch (error) {
      print("Error: $error");
      throw Exception('Failed to delete todo');
    }
  }

  Future<TodoResponse> updateTodo(Todo todo) async {
    try {
      final response = await http.patch(
        Uri.parse("$baseUrl/${todo.id}"),
        headers: headers,
        body: jsonEncode(todo),
      );
      final responseTodo = jsonDecode(response.body);
      print("responseTodo: $responseTodo");

      final updatedTodo = Todo.fromJson(responseTodo['todo']);
      final message = responseTodo['message'];

      return TodoResponse(updatedTodo, message);
    } catch (error) {
      print("Error: $error");
      throw Exception('Failed to update todo');
    }
  }
}