import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:soltech/modules/home/home_page.dart';

import '../../../constants.dart';



class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

 Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      Get.rawSnackbar(
          message: 'All fields are required.', backgroundColor: greenColor);
      return;
    }
    try {
      Get.to(() => HomeScreen());
      Get.rawSnackbar(
          message: 'Login Successful.', backgroundColor: greenColor);

    } catch (e) {
      String errorMessage;
      if (e.toString().contains('SocketException')) {
        errorMessage = 'No Internet Connection.';
      } else {
        // errorMessage = 'Failed to Load Data.';
        errorMessage = e.toString();
      }
      Get.rawSnackbar(message: errorMessage, backgroundColor: greenColor);
    }
  }
  @override
  void onClose() {
    passwordController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
