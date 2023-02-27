import 'package:flutter/material.dart';

class NewAccount extends StatelessWidget {
  final VoidCallback? onPressed;

  const NewAccount({this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/register');
      },
      child: const Align(
        alignment: Alignment.center,
        child: Text(
          "Already have an account ? SignIn",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
