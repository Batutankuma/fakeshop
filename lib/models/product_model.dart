import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String title;
  final String price;
  final String category;
  final String description;
  final String image;
  final Ratting rating;

  ProductModel(this.id, this.title, this.price, this.category, this.description,
      this.image, this.rating);

  factory ProductModel.fromJson(Map<String, dynamic> json, String id) {
    return ProductModel(
      id,
      json['title'],
      json['price'].toString(),
      json['category'],
      json['description'],
      json['image'],
      Ratting.fromJson(json['rating']),
    );
  }

  static List<ProductModel> fetchProduit(List<DocumentSnapshot> data) {
    return data
        .map((e) =>
            ProductModel.fromJson(e.data() as Map<String, dynamic>, e.id))
        .toList();
  }
}

class Ratting {
  final String rate;
  final String count;

  Ratting({required this.rate, required this.count});
  factory Ratting.fromJson(Map<String, dynamic> json) {
    return Ratting(
        rate: json['rate'].toString(), count: json['count'].toString());
  }
}
