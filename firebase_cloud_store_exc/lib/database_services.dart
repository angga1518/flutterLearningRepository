import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestore {
  static CollectionReference productCollection =
      FirebaseFirestore.instance.collection("products");

  static Future<void> addOrUpdateData(String id,
      {String nama, int harga}) async {
    await productCollection.doc(id).set({'nama': nama, 'harga': harga});
  }

  static Future<DocumentSnapshot> getData(String id) async {
    return await productCollection.doc(id).get();
  }

  static Future<void> deleteData(String id) async {
    await productCollection.doc(id).delete();
  }
}
