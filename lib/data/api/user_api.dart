class User {
  final String username;
  final String password;
  final String name;
  final String email;
  final int points;

  User({
    required this.username,
    required this.password,
    required this.name,
    required this.email,
    this.points = 1000,
  });

  // Convert a User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'name': name,
      'email': email,
      'points': points
    };
  }

  // Create a User object from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
      name: json['name'],
      email: json['email'],
      points: json['points']
    );
  }
}
