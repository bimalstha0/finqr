import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../home/home_page.dart';

class RegisterController extends GetxController {
  final isLoading = false.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> register() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      Get.rawSnackbar(message: 'All fields are required');
      return;
    }

    if (confirmPassword != password) {
      Get.rawSnackbar(message: 'Password does not match.');
      return;
    }
    isLoading(true);
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
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
