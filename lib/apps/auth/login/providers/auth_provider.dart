import 'package:bido/apps/auth/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../general/service/page_transition.dart';
import '../../../../widgets/toast/k_toasr.dart';
import '../../../home/screen/home_screen.dart';

class AuthNotifier {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  KToast toast = KToast();

  register({required String email, required String password, context}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var authCredential = credential.user;
      print(" register sign in displayname: ${credential.user?.displayName}");
      if (authCredential!.uid.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          BottomTransition(const LoginScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toast.toastMsg(msg: "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        toast.toastMsg(msg: "he account already exists for that email");
      }
    } catch (e) {
      print(e);
    }
  }

  login({required String email, required String password, context}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      var authCredential = credential.user;
      if (authCredential!.uid.isNotEmpty) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', authCredential.uid);
        print('############# this is ${authCredential.uid}');
        print(" email sign in displayname: ${authCredential.displayName}");
        Navigator.pushReplacement(
          context,
          BottomTransition(const HomeScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toast.toastMsg(msg: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        toast.toastMsg(msg: "Wrong password provided for that user.");
      }
    }
  }

  signInWithGoogle({context}) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    //return await FirebaseAuth.instance.signInWithCredential(credential);
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);
    if (userCredential.user!.uid.isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', userCredential.user!.uid);
      print('token from google ${userCredential.user!.uid}');
      Navigator.pushReplacement(
        context,
        BottomTransition(const HomeScreen()),
      );
      print(" gogle sign in displayname: ${userCredential.user?.displayName}");
    }
  }

}

