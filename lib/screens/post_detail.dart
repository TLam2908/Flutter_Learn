import 'package:flutter/material.dart';
import 'package:flutter_1/models/post.dart';
import 'package:flutter_1/controller/post_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({super.key, required this.post});

  final Post post;

  @override
  _PostDetail createState() => _PostDetail();
}

class _PostDetail extends State<PostDetail> {
  final PostController pController = Get.put(PostController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final PostController pController =
        Get.find<PostController>(); // Get the controller instance

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Detail Post",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Obx(() {
        final currentPost = pController.postList.firstWhere(
          (post) => post.id == widget.post.id,
          orElse: () => widget.post,
        );
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentPost.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    currentPost.description,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      final message = await pController.deletePost(
                        currentPost.id!,
                      );
                      if (message != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Post added successfully",
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Failed to delete post",
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                      Navigator.pop(context);
                    },
                    child: Text("Delete Post"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          _titleController.text = currentPost.title;
                          _descriptionController.text = currentPost.description;
                          return AlertDialog(
                            title: Text("Edit Post"),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  controller: _titleController,
                                  decoration: InputDecoration(
                                    hintText: "Edit title",
                                  ),
                                ),
                                TextField(
                                  controller: _descriptionController,
                                  decoration: InputDecoration(
                                    hintText: "Edit description",
                                  ),
                                  maxLines: 3,
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () async {
                                  final message = await pController.editedPost(
                                    widget.post.id!,
                                    Post(
                                      title: _titleController.text,
                                      description: _descriptionController.text,
                                    ),
                                  );
                                  if (message != null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Post edited successfully",
                                          style: GoogleFonts.lato(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Failed to edit post",
                                          style: GoogleFonts.lato(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                  Navigator.of(context).pop();
                                },
                                child: Text("Update"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Cancel"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text("Edit Post"),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
