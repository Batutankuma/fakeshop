import 'package:fakeshop/constant.dart';
import 'package:fakeshop/models/profil_model.dart';

class ProfilService {
  //find by id profil user
  static Future<ProfilModel> findByIdProfil(String uid, email) async {
    try {
      final result = await firestore.collection('profil').doc(uid).get();
      return ProfilModel.fromJson({
        "id": uid,
        "email": email,
        ...result.data() as Map<String, dynamic>,
      });
    } catch (e) {
      return Future.error(e);
    }
  }
}
