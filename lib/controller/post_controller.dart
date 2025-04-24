import 'package:get/get.dart';
import 'package:flutter_1/api/post.dart';
import 'package:flutter_1/models/post.dart';
import 'dart:collection';

PostApi _postApi = PostApi();

class PostController extends GetxController {
  final RxList<Post> _postList = <Post>[].obs;

  UnmodifiableListView<Post> get postList =>
      UnmodifiableListView(_postList);

  @override
  void onInit() {
    super.onInit();
    getPosts();
  }

  void getPosts() async {
    try {
      final responsePosts = await _postApi.fetchPosts();
      if (responsePosts != null) {
        _postList.assignAll(responsePosts);
      }
    } catch (e) {
      print("From GetxController, Error fetching posts: $e");
      throw Exception("Failed to fetch posts: $e");
    }
  }

  Future<String> addPosts(Post post) async {
    try {
      final response = await _postApi.addPosts(post);
      getPosts();
      return response.message;
    } catch (e) {
      print("From GetxController, Error adding post: $e");
      throw Exception("Failed to add post: $e");
    }
  }

  Future<String> deletePost(int id) async {
    try {
      final response = await _postApi.deletePost(id);
      getPosts();
      return response.message;
    } catch (e) {
      print("From GetxController, Error deleting post: $e");
      throw Exception("Failed to delete post: $e");
    }
  }

  Future<String> editedPost(int id, Post post) async {
    try {
      final response = await _postApi.editPost(id, post);
      if (response != null) {
        _postList.removeWhere((element) => element.id == id);
        _postList.add(response.post);
      }
      getPosts();
      return response.message;
    } catch (e) {
      print("From GetxController, Error updating post: $e");
      throw Exception("Failed to update post: $e");
    }
  }
}
