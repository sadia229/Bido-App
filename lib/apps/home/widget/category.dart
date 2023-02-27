import 'package:bido/general/utils/colors.dart';
import 'package:bido/general/utils/config.dart';
import 'package:bido/widgets/card/category_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final fireStore = FirebaseFirestore.instance.collection("cat").snapshots();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: context.screenWidth,
      child: Row(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: fireStore,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) return const Text("Something has error");
              if (snapshot.hasData) {
                return SizedBox(
                  width: context.screenWidth,
                  height: context.screenHeight * 0.05,
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final title = snapshot.data?.docs[index];
                      return CategoryCard(
                        category: title!["name"].toString(),
                      );
                    },
                  ),
                );
              }
              return const Text("No widget to build");
            },
          ),
        ],
      ),
    );
  }
}
