import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fakeshop/services/historique.service.dart';

class StoryModel {
  final String id;
  final String produitid;
  final String userid;
  //date d'achat du produit
  final DateTime date;

  StoryModel(
      {required this.id,
      required this.produitid,
      required this.userid,
      required this.date});

  factory StoryModel.fromJson(Map<String, dynamic> json, id) {
    HistoriqueService.getById(json['produitid']);
    return StoryModel(
        id: id,
        produitid: json['produitid'],
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
