import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soltech/modules/widgets/input_field.dart';
import 'package:soltech/modules/widgets/password_field.dart';

import '../../../constants.dart';
import '../../widgets/custom_button.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign In"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: greenDark,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your email and password ",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                ),
                const SizedBox(
                  height: 50,
                ),
                InputField(
                  label: "Email",
                  controller: controller.emailController,
                  inputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 30,
                ),
                PasswordField(
                  label: "Password",
                  controller: controller.passwordController,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Checkbox(
                        value: true,
                        activeColor: greenDark,
                        onChanged: (value) {
                          // setState(() {
                          //   remember = value;
                          // });
                        },
                      ),
                      const Text("Remember me"),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Forgot Password",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                              child: CustomButton("Login", () {
                                Navigator.pushNamed(context, '/home');

                              }),
                            ),
                    ),
                const SizedBox(
                  height: 50,
                ),
               
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Text(
                          "Register Now",
                          style: TextStyle(color: greenDark),
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons')
                  ],)
              ],
            ),
          ),
        ));
  }
}
