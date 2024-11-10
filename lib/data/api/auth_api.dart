import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class AuthApi {
  // Simulated login function for prototype
  static Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final storedUsers = prefs.getStringList('users') ?? [];
    bool isValid = false;
    String? token;

    // Check if the user exists and password matches
    for (var userData in storedUsers) {
      final user = json.decode(userData);
      if (user['username'] == username && user['password'] == password) {
        isValid = true;
        token = user['token'];
        break;
      }
    }

    if (isValid && token != null) {
      await prefs.setString('token', token);
      return LoginResponse(token: token);
    } else {
      throw Exception('Invalid Credentials.');
    }
  }

  // Simulated registration function for prototype
  static Future<LoginResponse> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final storedUsers = prefs.getStringList('users') ?? [];
    final token = 'sample_token_${DateTime.now().millisecondsSinceEpoch}';
    final newUser = {
      'username': email,  // Assuming email is used as username
      'name': name,
      'password': password,
      'token': token,
    };

    // Save new user data to shared preferences
    storedUsers.add(json.encode(newUser));
    await prefs.setStringList('users', storedUsers);
    await prefs.setString('token', token);

    return LoginResponse(token: token);
  }

  // Simulated change password function for prototype
  static Future<void> changePassword({
    required String newPassword,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final storedUsers = prefs.getStringList('users') ?? [];
    bool passwordChanged = false;

    for (int i = 0; i < storedUsers.length; i++) {
      var userData = json.decode(storedUsers[i]);

      if (userData['token'] == token) {
        userData['password'] = newPassword;
        storedUsers[i] = json.encode(userData);
        passwordChanged = true;
        break;
      }
    }

    if (passwordChanged) {
      await prefs.setStringList('users', storedUsers);
    } else {
      throw Exception("Token not valid.");
    }
  }
}

// Response classes for handling login/register responses
class LoginResponse {
  final String? token;

  LoginResponse({this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(token: json['token']);
  }
}

class LoginRequest {
  final String username;
  final String password;

  LoginRequest({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }
}

class RegisterRequest {
  final String name;
  final String email;
  final String password;

  RegisterRequest({required this.name, required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'password': password};
  }
}
