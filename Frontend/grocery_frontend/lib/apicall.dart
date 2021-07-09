import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductProvider {
  List<Product> products = [];
final apiPath;
ProductProvider(this.apiPath);
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(
        'http://192.168.1.15:8000/${this.apiPath}',
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

  Product(this.id, this.name, this.desc);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['product_id'],
      json['product_name'],
      json['description'],
    );
  }
}