import 'package:bido/general/utils/config.dart';
import 'package:bido/general/utils/text_style.dart';
import 'package:bido/widgets/card/products_card.dart';
import 'package:flutter/material.dart';

class NewSells extends StatelessWidget {
  const NewSells({Key? key}) : super(key: key);

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
        Container(
          height: context.screenHeight * 0.37,
          width: context.screenWidth,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return ProductsCard();
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
