class Product {
  final String name;
  final String img;
  final int price;

  Product({
    required this.name,
    required this.img,
    required this.price,
  });

  // Convert a User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'img': img,
      'price': price
    };
  }

  // Create a User object from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'],
      img: json['img'],
    );
  }
}
