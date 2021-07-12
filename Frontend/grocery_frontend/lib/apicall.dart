import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductProvider {
  List<Product> products = [];
  final apiPath;
  ProductProvider(this.apiPath);
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(
        'http://10.0.2.2:8000/${this.apiPath}',
      );
      var data = json.decode(response.body) as List;
      products = data.map((json) => Product.fromJson(json)).toList();
      return products;
    } catch (e) {
      print('error $e');
    }
    return [];
  }
}

class Product {
  final int id;
  final String name;
  final String desc;
  final subcategory;
  final category;
  final price;
  final image;

  Product(this.id, this.name, this.desc, this.category, this.subcategory,
      this.price, this.image);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['product_id'],
      json['product_name'],
      json['description'],
      json['category'],
      json['subcategory'],
      json['price'],
      json['image'],
    );
  }
}
