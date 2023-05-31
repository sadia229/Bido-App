import 'package:bido/apps/home/widget/new_offers.dart';
import 'package:bido/widgets/appbar/k_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/category.dart';
import '../widget/my_list.dart';
import '../widget/my_posted_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: KAppBar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              Text("jkjkjk"),
              Category(),
              SizedBox(height: 20),
              PostedItems(),
              NewOffers(),
              MyList()
            ],
          ),
        ),
      ),
    );
  }
}
//kmolkfldf