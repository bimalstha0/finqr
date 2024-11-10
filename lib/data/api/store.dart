import 'product.dart';

class Store {
  final String name;
  final String address;
  final String img;
  final String email;
  final List<Product> top10;

  Store({
    required this.name,
    required this.address,
    required this.img,
    required this.email,
    required this.top10
  });

  // Convert a User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'email': email,
      'img': img,
      'top10': top10
    };
  }

  // Create a User object from JSON
  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      name: json['name'],
      address: json['address'],
      email: json['email'],
      img: json['img'],
      top10: json['top10']
    );
  }
}
