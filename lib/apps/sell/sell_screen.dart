import 'package:bido/general/utils/text_style.dart';
import 'package:flutter/material.dart';

import '../../widgets/textField/k_textField.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController bidPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _addProducts("Product Name", name, "Product Name"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Product Description", style: KTextStyle.title4),
                const SizedBox(height: 8),
                KTextField(
                  label: "Product Description",
                  controller: description,
                ),
                const SizedBox(height: 15),
              ],
            ),
            _addProducts("Bid Price", bidPrice, "Bid Price"),
            Text("End Date", style: KTextStyle.title4),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Column _addProducts(text, TextEditingController controller, label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: KTextStyle.title4),
        const SizedBox(height: 8),
        KTextField(
          label: label,
          controller: controller,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
