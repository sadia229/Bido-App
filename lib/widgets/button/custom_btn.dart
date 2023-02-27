import 'package:flutter/material.dart';

import '../../general/utils/text_style.dart';

class KButton extends StatelessWidget {
  final Color btnColor;
  final double btnWidth;
  final String btnText;
  final VoidCallback tap;

  const KButton({
    Key? key,
    required this.btnColor,
    required this.btnWidth,
    required this.btnText,
    required this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        width: btnWidth,
        padding: const EdgeInsets.all(11.5),
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          btnText,
          textAlign: TextAlign.center,
          style: KTextStyle.title4.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
