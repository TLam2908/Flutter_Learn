import 'package:get/get.dart';

class RegisterController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var name = ''.obs;

  String get getEmail => email.value;
  String get getPassword => password.value;
  String get getName => name.value;

  void setEmail(String value) {
    email.value = value;
    update();
  }

  void setPassword(String value) {
    password.value = value;
    update();
  }

  void setName(String value) {
    name.value = value;
    update();
  }
}