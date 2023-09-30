import 'package:chatapp/consts/firebase_consts.dart';

class StoreService {
  static getUser(String id) {
    return firebaseFirestore
        .collection(collectionUser)
        .where('id', isEqualTo: id)
        .get();
  }
}
