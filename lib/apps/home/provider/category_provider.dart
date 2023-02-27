import 'package:cloud_firestore/cloud_firestore.dart';

class Categories{
  List categories = [];
  getCategories() async {
    var fireStoreInstance = FirebaseFirestore.instance;
    QuerySnapshot q = await fireStoreInstance.collection("category").get();
    for(int i=0;i<q.docs.length;i++){
      categories.add(
      q.docs[i]["category-name"],
      );
      print(q.docs[i]["category-name"]);
    }
  }
}