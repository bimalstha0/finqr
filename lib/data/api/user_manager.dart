import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'user_api.dart';

class UserManager {
  static const String userKey = 'userList';

  // Save a new user
  Future<void> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> users = prefs.getStringList(userKey) ?? [];

    // Add new user JSON to the list
    users.add(jsonEncode(user.toJson()));

    // Update Shared Preferences
    await prefs.setStringList(userKey, users);
  }

  // Retrieve all users
  Future<List<User>> getAllUsers() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> users = prefs.getStringList(userKey) ?? [];

    // Convert JSON strings back to User objects
    return users.map((userJson) => User.fromJson(jsonDecode(userJson))).toList();
  }

  // Clear all users (for logout or reset purposes)
  Future<void> clearAllUsers() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(userKey);
  }

  Future<bool> validateUserLogin(String username, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve stored username and password
    String? storedUsername = prefs.getString('username');
    String? storedPassword = prefs.getString('password');

    // Compare input with stored values
    return username == storedUsername && password == storedPassword;
  }

  Future<void> clearUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clears all stored data
  }
}

