import 'package:flutter/material.dart';
import 'package:flutter_1/controller/todo_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_1/models/todo.dart';
import 'package:flutter_1/api/todo.dart';
import 'package:get/get.dart';

class TripsPage extends StatefulWidget {
  const TripsPage({super.key, this.searchText});

  final String? searchText;

  @override
  _TripsPageState createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  final TodoApi todoApi = TodoApi();
  final todoController tdController = Get.put(todoController());
  final TextEditingController _todoController = TextEditingController();
  final TextEditingController _editTodoController = TextEditingController();

  List<Todo> todoList = [];

  @override
  void initState() {
    super.initState();
    final response = todoApi.getTodos();
    response
        .then((value) {
          setState(() {
            todoList = value.todos;
          });
        })
        .catchError((error) {
          print("Error: $error");
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Todo List',
                style: GoogleFonts.lato(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 270,
                      child: TextField(
                        controller: _todoController,
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.5,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide(
                              color: Colors.grey.shade200,
                              width: 0.5,
                            ),
                          ),
                          hintText: "Add your todo",
                          hintStyle: GoogleFonts.lato(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // if (_todoController.text.isNotEmpty) {
                        //   tdController.addTodo(_todoController.text);
                        //   _todoController.clear();
                        // }

                        tdController.saveTodoReference(_todoController.text);
                        // try {
                        //   if (_todoController.text.isNotEmpty) {
                        //     Todo createTodo = Todo(title: _todoController.text);
                        //     final response = await todoApi.createTodo(
                        //       createTodo,
                        //     );
                        //     if (response.todo != null) {
                        //       ScaffoldMessenger.of(context).showSnackBar(
                        //         SnackBar(
                        //           content: Text(
                        //             response.message,
                        //             style: GoogleFonts.lato(
                        //               fontSize: 12,
                        //               color: Colors.white,
                        //             ),
                        //           ),
                        //           backgroundColor: Colors.green,
                        //         ),
                        //       );
                        //     }
                        //   }
                        // } catch (e) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(
                        //       content: Text(
                        //         "Create todo failed: $e",
                        //         style: GoogleFonts.lato(
                        //           fontSize: 12,
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //       backgroundColor: Colors.red,
                        //     ),
                        //   );
                        // }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.pink,
                        ),
                      ),
                      child: Text(
                        "Add",
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Obx(() {
              //   return Expanded(
              //     child: ListView.builder(
              //       shrinkWrap: true,
              //       physics: NeverScrollableScrollPhysics(),
              //       itemCount: tdController.todoList.length,
              //       itemBuilder: (BuildContext context, int index) {
              //         return ListTile(
              //           title: Text(
              //             "Todo ${index + 1}: ${tdController.todoList[index]}",
              //             style: GoogleFonts.lato(
              //               fontSize: 12,
              //               fontWeight: FontWeight.normal,
              //               color: Colors.black,
              //             ),
              //           ),
              //           trailing: Row(
              //             mainAxisSize: MainAxisSize.min,
              //             children: [
              //               IconButton(
              //                 icon: Icon(Icons.edit),
              //                 onPressed: () {
              //                   // _editTodoController.text = tdController.todoList[index]; // Pre-fill the text field
              //                   tdController.editTodo(_todoController.text);
              //                   showDialog(
              //                     context: context,
              //                     builder: (_) {
              //                       return AlertDialog(
              //                         title: Text("Edit Todo"),
              //                         content: TextField(
              //                           controller: _editTodoController,
              //                           decoration: InputDecoration(
              //                             hintText: "Edit your todo",
              //                           ),
              //                         ),
              //                         actions: [
              //                           TextButton(
              //                             onPressed: () {
              //                               if (_editTodoController
              //                                   .text
              //                                   .isNotEmpty) {
              //                                 tdController.updateTodo(
              //                                   index,
              //                                   _editTodoController.text,
              //                                 );
              //                                 _editTodoController.clear();
              //                                 Navigator.of(context).pop();
              //                               }
              //                             },
              //                             child: Text("Update"),
              //                           ),
              //                           TextButton(
              //                             onPressed: () {
              //                               Navigator.of(context).pop();
              //                             },
              //                             child: Text("Cancel"),
              //                           ),
              //                         ],
              //                       );
              //                     },
              //                   );
              //                 },
              //               ),
              //               IconButton(
              //                 icon: Icon(Icons.delete),
              //                 onPressed: () {
              //                   tdController.removeTodo(index);
              //                 },
              //               ),
              //             ],
              //           ),
              //         );
              //       },
              //     ),
              //   );
              // }),
              // Expanded(
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     physics: NeverScrollableScrollPhysics(),
              //     itemCount: todoList.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return ListTile(
              //         title: Text(
              //           "Todo ${todoList[index].id}: ${todoList[index].title}",
              //           style: GoogleFonts.lato(
              //             fontSize: 12,
              //             fontWeight: FontWeight.normal,
              //             color: Colors.black,
              //           ),
              //         ),
              //         trailing: Row(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             IconButton(
              //               icon: Icon(Icons.edit),
              //               onPressed: () {
              //                 showDialog(
              //                   context: context,
              //                   builder: (_) {
              //                     _editTodoController.text =
              //                         todoList[index]
              //                             .title; // Pre-fill the text field
              //                     return AlertDialog(
              //                       title: Text("Edit Todo"),
              //                       content: TextField(
              //                         controller: _editTodoController,
              //                         decoration: InputDecoration(
              //                           hintText: "Edit your todo",
              //                         ),
              //                       ),
              //                       actions: [
              //                         TextButton(
              //                           onPressed: () async {
              //                             Todo updateTodo = Todo(
              //                               id: todoList[index].id!,
              //                               title: _editTodoController.text,
              //                             );
              //                             if (_editTodoController
              //                                 .text
              //                                 .isNotEmpty) {
              //                               todoApi.updateTodo(
              //                                 updateTodo
              //                               );
              //                               _editTodoController.clear();
              //                               Navigator.of(context).pop();
              //                             }
              //                           },
              //                           child: Text("Update"),
              //                         ),
              //                         TextButton(
              //                           onPressed: () {
              //                             Navigator.of(context).pop();
              //                           },
              //                           child: Text("Cancel"),
              //                         ),
              //                       ],
              //                     );
              //                   },
              //                 );
              //               },
              //             ),
              //             IconButton(
              //               icon: Icon(Icons.delete),
              //               onPressed: () async {
              //                 try {
              //                   final response = await todoApi.deleteTodo(
              //                     todoList[index].id!, //! mean not null
              //                   );
              //                   if (response.todo != null) {
              //                     ScaffoldMessenger.of(context).showSnackBar(
              //                       SnackBar(
              //                         content: Text(
              //                           response.message,
              //                           style: GoogleFonts.lato(
              //                             fontSize: 12,
              //                             color: Colors.white,
              //                           ),
              //                         ),
              //                         backgroundColor: Colors.green,
              //                       ),
              //                     );
              //                   }
              //                 } catch (e) {
              //                   ScaffoldMessenger.of(context).showSnackBar(
              //                     SnackBar(
              //                       content: Text(
              //                         "Delete todo failed: $e",
              //                         style: GoogleFonts.lato(
              //                           fontSize: 12,
              //                           color: Colors.white,
              //                         ),
              //                       ),
              //                       backgroundColor: Colors.red,
              //                     ),
              //                   );
              //                 }
              //               },
              //             ),
              //           ],
              //         ),
              //       );
              //     },
              //   ),
              // ),
              Obx(() {
                return Visibility(
                  visible: tdController.todoTitle.value != null,
                  child: Text(tdController.todoTitle.value),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
