import 'package:bido/apps/auth/login/providers/auth_provider.dart';
import 'package:bido/general/utils/config.dart';
import 'package:bido/widgets/button/custom_btn.dart';
import 'package:bido/widgets/button/or/k_or.dart';
import 'package:flutter/material.dart';
import '../../../widgets/button/google_btn.dart';
import '../../../widgets/textField/k_textField.dart';
import '../../../widgets/textField/password_textField.dart';
import 'components/auth_msg.dart';
import 'components/forget_password.dart';
import 'components/new_account.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final globalKey = GlobalKey<FormState>();
  AuthNotifier authNotifier = AuthNotifier();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Form(
            key: globalKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthMessage(
                    title: "Welcome To Bido",
                    subtitle: "Log in to your account",
                  ),
                  SizedBox(height: context.screenHeight * 0.1),
                  KTextField(
                    label: "Email",
                    icon: Icon(
                      Icons.email_outlined,
                      color: Colors.black.withOpacity(0.3),
                    ),
                    controller: email,
                  ),
                  const SizedBox(height: 12),
                  PasswordTextField(
                    label: "Password",
                    controller: password,
                    icon: Icon(Icons.vpn_key_outlined,
                        color: Colors.black.withOpacity(0.3)),
                  ),
                  const SizedBox(height: 12),
                  ForgetPassword(onPressed: () {}),
                  const SizedBox(height: 16),
                  KButton(
                    btnColor: Colors.lightBlue,
                    btnWidth: context.screenWidth,
                    btnText: 'Login',
                    tap: () {
                      authNotifier.login(
                        email: email.text,
                        password: password.text,
                        context: context
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  const NewAccount(),
                  const Or(),
                  const CustomGoogleBtn(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
