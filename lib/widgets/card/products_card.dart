import 'package:bido/general/utils/config.dart';
import 'package:flutter/material.dart';

import '../../general/utils/text_style.dart';

class ProductsCard extends StatefulWidget {
  final String image;
  final String name;
  final String description;
  final String price;
  final String countDate;
  final VoidCallback tap;
  const ProductsCard({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.countDate,
    required this.tap,
  }) : super(key: key);

  @override
  State<ProductsCard> createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.tap,
      child: Column(
        children: [
          Container(
            width: context.screenWidth * 0.6,
            margin: const EdgeInsets.symmetric(horizontal: 8),
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
                        child: Image.network(
                          widget.image,
                          height: 140.0,
                          width: context.screenWidth,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(widget.name, style: KTextStyle.title6),
                    const SizedBox(height: 5),
                    Text(widget.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: KTextStyle.title6),
                    Text(
                      "${widget.price} TK",
                      style: KTextStyle.title1.copyWith(color: Colors.red),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.countDate,
                      style: KTextStyle.title3,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
