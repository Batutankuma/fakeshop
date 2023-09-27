import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fakeshop/constant.dart';
import 'package:fakeshop/models/product_model.dart';

class StoryModel {
  final String id;
  final ProductModel produitid;
  final String userid;
  //date d'achat du produit
  final DateTime date;

  StoryModel(
      {required this.id,
      required this.produitid,
      required this.userid,
      required this.date});

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
        id: json['userid'],
        produitid: ProductModel.fromJson(
            json['produit'] as Map<String, dynamic>, json['produitid']),
        userid: json['userid'],
        date: convertTimestampToDatetime(json['date_achat']));
  }

  static List<StoryModel> fetchStory(List<Map<String, dynamic>> data) {
    return data.map((e) {
      return StoryModel.fromJson(e);
    }).toList();
  }
}

DateTime convertTimestampToDatetime(Timestamp timestamp) {
  return DateTime.fromMillisecondsSinceEpoch(timestamp.seconds * 1000);
}
