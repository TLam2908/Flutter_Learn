import 'dart:convert';
import 'package:http/http.dart' as http;
import '/models/user.dart';

class RegisterResponse {
  final String message;
  final User user;

  RegisterResponse(this.user, this.message);
}

class LoginResponse {
  final String message;
  final User user;

  LoginResponse(this.user, this.message);
}

class AuthenticationApi {
  final String baseUrl = "http://10.0.2.2:3000";

  Map<String, String> get headers => {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<RegisterResponse> registerUser(
    String name,
    String email,
    String password,
  ) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/users"),
        headers: headers,
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      );
      final responseData = jsonDecode(response.body);
      print("responsedata: $responseData");
      final user = User.fromJson(responseData['user']);
      final message = responseData['message'];
      return RegisterResponse(user, message);
    } catch (error) {
      print("Error: $error");
      throw Exception('Failed to register');
    }
  }

  Future<LoginResponse> loginUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/auth/login"),
        headers: headers,
        body: jsonEncode({'email': email, 'password': password}),
      );
      final responseData = jsonDecode(response.body);
      final user = User.fromJson(responseData['user']);
      final message = responseData['message'];
      return LoginResponse(user, message);
    } catch (error) {
      print("Error: $error");
      throw Exception('Failed to login');
    }
  }

  Future<String> logoutUser() async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/auth/logout"),
        headers: headers,
      );
      final responseData = jsonDecode(response.body);
      return responseData['message'];
    } catch (error) {
      print("Error: $error");
      throw Exception('Failed to logout');
    }
  }
}
