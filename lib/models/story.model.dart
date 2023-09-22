import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fakeshop/constant.dart';
import 'package:fakeshop/models/product_model.dart';

late ProductModel productModel;

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

  factory StoryModel.fromJson(Map<String, dynamic> json, id) {
    getProduitDoc(json['produitid']);
    return StoryModel(
        id: id,
        produitid: productModel,
        userid: json['userid'],
        date: convertTimestampToDatetime(json['date_achat']));
  }

  static List<StoryModel> fetchStory(List<DocumentSnapshot> data) {
    return data
        .map((e) => StoryModel.fromJson(e.data() as Map<String, dynamic>, e.id))
        .toList();
  }
}

DateTime convertTimestampToDatetime(Timestamp timestamp) {
  return DateTime.fromMillisecondsSinceEpoch(timestamp.seconds * 1000);
}

Future<void> getProduitDoc(String idDoc) async {
  final produitId = await firestore.collection('produit').doc(idDoc).get();
  //assigner la valeur dans notre
  productModel = ProductModel.fromJson(
      produitId.data() as Map<String, dynamic>, produitId.id);
}
