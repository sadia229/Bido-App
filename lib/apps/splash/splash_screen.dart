import 'package:bido/apps/auth/login/login_screen.dart';
import 'package:bido/apps/main_screen.dart';
import 'package:bido/general/utils/asset_path.dart';
import 'package:bido/general/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../general/service/page_transition.dart';


class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    navigator();
    super.initState();
  }

  void navigator() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print("ttttttttttttttttttttttt${prefs.getString('token')}");

    await Future.delayed(const Duration(milliseconds: 3000));
    if (token != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        BottomTransition(const MainScreen()),
      );
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        BottomTransition(const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.white,
      body: Center(
        child: Image.asset(AssetPath.logo),
      ),
    );
  }
}
