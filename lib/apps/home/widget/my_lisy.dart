import 'package:bido/apps/sell/providers/seller_provider.dart';
import 'package:bido/general/utils/config.dart';
import 'package:bido/general/utils/text_style.dart';
import 'package:bido/widgets/card/products_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  final fireStore =
      FirebaseFirestore.instance.collection("my-list").snapshots();
  SellerProvider sellerProvider = SellerProvider();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text("New Offers",
                        textAlign: TextAlign.end, style: KTextStyle.title1),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Text("Show All",
                    textAlign: TextAlign.end, style: KTextStyle.title3),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
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
                height: context.screenHeight * 0.37,
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final products = snapshot.data?.docs[index];

                    return ProductsCard(
                      image: products!["image"].toString(),
                      name: products["name"].toString(),
                      description: products["description"].toString(),
                      price: products["price"].toString(),
                      countDate: DateFormat('d MMM y').format(
                          DateTime.parse(products["current-date"].toString())),
                      tap: () {
                        Navigator.pushNamed(
                          context,
                          '/sellDetails',
                          arguments: {
                            'img': products["image"].toString(),
                            'name': products["name"].toString(),
                            'description': products["description"].toString(),
                            'priceimg': products["price"].toString(),
                            'check': true,
                          },
                        );
                      },
                    );
                  },
                ),
              );
            }
            return const Text("No widget to build");
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
