import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:keyfhane/models/User.dart';

class FirestoreServisi {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DateTime zaman = DateTime.now();
  Future<void> kullaniciolustur(
      {String? id,
      String? userName,
      String? photourl="",
      String? email
    }) async {
    await _firestore.collection("kullanicilar").doc(id).set({
      "userName": userName,
      "email": email,
      "kullaniciid": id,
      "fotourl": photourl,
      "olusturulmazamani": zaman,
    });
  }

  Future<MyUser?> kullanicigetir(String id) async {
    DocumentSnapshot documentSnapshot =
        await _firestore.collection("kullanicilar").doc(id).get();
    if (!documentSnapshot.exists) {
      return null;
    } else {
      return MyUser.dokumandanUret(documentSnapshot);
    }
  }
}
