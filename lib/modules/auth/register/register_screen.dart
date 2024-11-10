
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/input_field.dart';
import '../../widgets/password_field.dart';
import 'register_controller.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign Up"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text("Register Account",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: greenDark,
                    )),
                const Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                InputField(
                  label: "Full Name",
                  textInputAction: TextInputAction.next,
                  controller: controller.nameController,
                ),
                const SizedBox(
                  height: 30,
                ),
                InputField(
                  label: "Email",
                  inputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: controller.emailController,
                ),
                const SizedBox(
                  height: 30,
                ),
                PasswordField(
                  label: "Password",
                  controller: controller.passwordController,
                ),
                const SizedBox(
                  height: 30,
                ),
                PasswordField(
                  label: "Confirm Password",
                  controller: controller.confirmPasswordController,
                ),
                const SizedBox(height: 50),
                Center(
                    child:CustomButton("Register", controller.register)),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'By continuing your confirm that you agree \nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
