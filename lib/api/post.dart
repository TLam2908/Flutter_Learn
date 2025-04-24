import 'dart:convert';

import 'package:flutter_1/models/post.dart';
import 'package:http/http.dart' as http;

class PostResponse {
  final String message;
  final Post post;

  PostResponse(this.post, this.message);
}

class PostApi {
  final String baseUrl = "https://nest-flutter.vercel.app/post";

  Map<String, String> get headers => {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      final responseBody = jsonDecode(response.body);

      print("Response: ${responseBody['posts']}");
      final responsePosts = responseBody['posts'];
      List<Post> posts = [];

      for (var post in responsePosts) {
        posts.add(Post.fromJson(post as Map<String, dynamic>));
      }
      return posts;
    } catch (e) {
      print("From PostAPI, Error fetching posts: $e");
      throw Exception('Failed to load posts');
    }
  }

  Future<PostResponse> addPosts(Post post) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: headers,
        body: jsonEncode(post.toJson()),
      );

      final responsePost = jsonDecode(response.body);
      print("responsePost: $responsePost");
      
      final createdPost = Post.fromJson(responsePost['post']);
      final message = responsePost['message'];
      
      return PostResponse(post, message);
    } catch (e) {
      print("From PostAPI, Error adding post: $e");
      throw Exception('Failed to add post');
    }
  }
}
