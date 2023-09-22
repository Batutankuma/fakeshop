import 'package:fakeshop/constant.dart';

class HistoriqueService {
  //find by Id
  static getById(String id) {
    return firestore.collection('produit').where('id', isEqualTo: id);
  }
}
