import 'package:bido/general/utils/colors.dart';
import 'package:bido/general/utils/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconBtn extends StatelessWidget {
  final VoidCallback onPressed;

  const IconBtn({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: context.screenWidth,
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          border: Border.all(color: KColor.primary, width: 2),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Icon(CupertinoIcons.camera, color: KColor.primary),
      ),
    );
  }
}
