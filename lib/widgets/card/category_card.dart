import 'package:bido/general/utils/colors.dart';
import 'package:bido/general/utils/config.dart';
import 'package:bido/general/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  final String category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth*0.3,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(right: 5,left: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: KColor.primary,
      ),
      child: Center(
        child: Text(
          widget.category,
          textAlign: TextAlign.end,
          style: KTextStyle.title3.copyWith(color: KColor.white),
        ),
      ),
    );
  }
}
