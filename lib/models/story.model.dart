import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fakeshop/models/product_model.dart';

class StoryModel {
  final String id;
  //final Map<String, dynamic> produitid;
  final String userid;
  //date d'achat du produit
  final DateTime date;
  late ProductModel productModel;

  StoryModel(
      {required this.id,
      //required this.produitid,
      required this.userid,
      required this.date});

  factory StoryModel.fromJson(Map<String, dynamic> json, id) {
    return StoryModel(
        id: id,
        userid: json['userid'],
        date: convertTimestampToDatetime(json['date_achat']));
  }

  static List<StoryModel> fetchStory(List<DocumentSnapshot> data) {
    return data.map((e) {
      return StoryModel.fromJson(e.data() as Map<String, dynamic>, e.id);
    }).toList();
  }
}

DateTime convertTimestampToDatetime(Timestamp timestamp) {
  return DateTime.fromMillisecondsSinceEpoch(timestamp.seconds * 1000);
}
