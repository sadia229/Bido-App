import 'package:bido/apps/auth/login/login_screen.dart';
import 'package:bido/apps/main_screen.dart';
import 'package:bido/general/utils/colors.dart';
import 'package:bido/general/utils/text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../general/service/page_transition.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: KColor.primary,
        title: const Text("Settings"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            InkWell(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                  context,
                  BottomTransition(const LoginScreen()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Settings", style: KTextStyle.title1),
                  Icon(
                    Icons.logout,
                    color: KColor.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
