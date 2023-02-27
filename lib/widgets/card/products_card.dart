import 'package:bido/general/utils/config.dart';
import 'package:flutter/material.dart';

import '../../general/utils/text_style.dart';

class ProductsCard extends StatefulWidget {
  const ProductsCard({Key? key}) : super(key: key);

  @override
  State<ProductsCard> createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: context.screenWidth * 0.6,
          margin: const EdgeInsets.only(right: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.white,
            elevation: 5,
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        "assets/image/tshirt.png",
                        height: 140.0,
                        width: context.screenWidth * 0.4,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  //const SizedBox(height: 10),
                  Text(
                      'Fas',
                      style: KTextStyle.title6
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Fashionable Cotton 3 quarter Pant for Men',
                    style: KTextStyle.title6
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '12.45 tk',
                            style: KTextStyle.title1
                                .copyWith(color: Colors.red),
                          ),
                          Text(
                            '(4/5)',
                            style: KTextStyle.title3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 3,
          top: 0,
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
                color: Colors.pink,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
