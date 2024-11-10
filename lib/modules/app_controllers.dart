import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/api/auth_api.dart';
import '../data/api/user_api.dart';

class AppController extends GetxController {
  final isLoggedIn = false.obs;
  final SharedPreferences sharedPreferences;
  User? userProfile;
  final isProfileLoading = false.obs;
  final isNoInternet = false.obs;

  AppController(this.sharedPreferences) {
    // Initialize login state based on token presence
    String? token = sharedPreferences.getString('token');
    if (token == null || token.isEmpty) {
      isLoggedIn(false);
    } else {
      isLoggedIn(true);
      // getUserProfile(token);
    }
  }

  // Loads the user profile data from SharedPreferences
  // void getUserProfile(String token) async {
  //   isProfileLoading(true);
  //   try {
  //     final storedUsers = sharedPreferences.getStringList('users') ?? [];
  //     for (var userData in storedUsers) {
  //       final user = User.fromJson(userData);
  //       if (user.token == token) {
  //         userProfile = user;// Assuming orders are also local
  //         break;
  //       }
  //     }
  //   } catch (e) {
  //     logout();
  //   } finally {
  //     isProfileLoading(false);
  //   }
  // }

  // Login function using the prototype AuthApi
  Future<void> login(String username, String password) async {
    try {
      final loginResponse = await AuthApi.login(username: username, password: password);
      sharedPreferences.setString('token', loginResponse.token!);
      isLoggedIn(true);
      // getUserProfile(loginResponse.token!);
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }

  // Register a new user and store details in SharedPreferences
  Future<void> register(String name, String email, String password) async {
    try {
      final loginResponse = await AuthApi.register(name: name, email: email, password: password);
      sharedPreferences.setString('token', loginResponse.token!);
      isLoggedIn(true);
      // getUserProfile(loginResponse.token!);
    } catch (e) {
      throw Exception('Registration failed: ${e.toString()}');
    }
  }

  // Change password locally for the current user
  Future<void> changePassword(String newPassword) async {
    try {
      await AuthApi.changePassword(newPassword: newPassword);
    } catch (e) {
      throw Exception('Failed to change password: ${e.toString()}');
    }
  }

  // Logs out by clearing the token and profile data
  void logout() {
    sharedPreferences.setString('token', '');
    sharedPreferences.remove('userProfile');
    isLoggedIn(false);
  }

  // Update the user profile in memory and SharedPreferences
  // void updateProfile(User user) {
  //   userProfile = user;
  //   final storedUsers = sharedPreferences.getStringList('userList') ?? [];
  //   for (int i = 0; i < storedUsers.length; i++) {
  //     var userData = User.fromJson(storedUsers[i]);
  //     if (userData.token == sharedPreferences.getString('token')) {
  //       storedUsers[i] = user.toJson();
  //       break;
  //     }
  //   }
  //   sharedPreferences.setStringList('users', storedUsers);
  //   update();
  // }

  // Retrieve the token from SharedPreferences
  String getToken() {
    return sharedPreferences.getString('token') ?? '';
  }
}
