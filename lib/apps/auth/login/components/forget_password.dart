import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  final VoidCallback? onPressed;

  const ForgetPassword({this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: const Align(
        alignment: Alignment.bottomRight,
        child: Text(
          "Forget Password?",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
