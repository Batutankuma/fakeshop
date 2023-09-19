import 'dart:convert';
import 'package:fakeshop/models/product_model.dart';
import 'package:http/http.dart' as http;

Future<ProductModel> fetchProduct() async {
  final response =
      await http.get(Uri.parse("https://fakestoreapi.com/products"));
  if (response.statusCode == 200) {
    return ProductModel.fromJson(jsonDecode(response.body), 'd');
  } else {
    throw Exception("Failed to load album");
  }
}

List<ProductModel> parseProduct(String responseProduct) {
  final parsed = jsonDecode(responseProduct).cast<Map<String, dynamic>>();
  return parsed
      .map<ProductModel>((json) => ProductModel.fromJson(json, 'e'))
      .toList();
}

Future<List<ProductModel>> fetchProductList(http.Client client) async {
  final response =
      await client.get(Uri.parse("https://fakestoreapi.com/products"));
  return parseProduct(response.body);
}
