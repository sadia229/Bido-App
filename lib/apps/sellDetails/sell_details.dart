import 'package:bido/apps/main_screen.dart';
import 'package:bido/apps/sell/providers/seller_provider.dart';
import 'package:bido/general/utils/colors.dart';
import 'package:bido/general/utils/config.dart';
import 'package:bido/general/utils/text_style.dart';
import 'package:bido/widgets/button/custom_btn.dart';
import 'package:bido/widgets/textField/k_textField.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../general/service/page_transition.dart';

class SellDetails extends StatefulWidget {
  final String img;
  final String name;
  final String description;
  final String priceimg;
  final bool check;
  const SellDetails({
    super.key,
    required this.img,
    required this.name,
    required this.description,
    required this.priceimg,
    required this.check,
  });

  @override
  State<SellDetails> createState() => _SellDetailsState();
}

class _SellDetailsState extends State<SellDetails> {
  TextEditingController bidPrice = TextEditingController();
  SellerProvider seller = SellerProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: KColor.primary,
        title: const Text("Details"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget.img,
                  height: 140.0,
                  width: context.screenWidth,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(widget.name, style: KTextStyle.headline3),
            const SizedBox(height: 5),
            Text(widget.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: KTextStyle.title6),
            Text(
              "${widget.priceimg} TK",
              style: KTextStyle.title1.copyWith(color: Colors.red),
            ),
            if (widget.check == false)
              Column(
                children: [
                  Text("Bid Price", style: KTextStyle.title4),
                  const SizedBox(height: 8),
                  KTextField(
                    label: "Bid Price",
                    controller: bidPrice,
                  ),
                  const SizedBox(height: 15),
                  KButton(
                    btnColor: KColor.primary,
                    btnWidth: context.screenWidth,
                    btnText: 'Bid',
                    tap: () {
                      seller.addMyList(
                        name: widget.name,
                        description: widget.description,
                        price: bidPrice.text,
                        date: DateFormat(
                          'yyyy-MM-dd',
                        ).format(DateTime.now()).toString(),
                        image: widget.img,
                      );
                      Navigator.pushReplacement(
                        context,
                        BottomTransition(const MainScreen()),
                      );
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
