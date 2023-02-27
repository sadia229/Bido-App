import 'package:flutter/material.dart';

class SignupSection extends StatelessWidget {
  const SignupSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'Dont’t have an account?  ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            TextSpan(
              text: 'Sign up',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.6)),
            ),
          ],
        ),
      ),
    );
  }
}
