import 'package:bido/apps/auth/register/register_screen.dart';
import 'package:bido/apps/home/screen/home_screen.dart';
import 'package:bido/apps/main_screen.dart';
import 'package:bido/apps/sellDetails/sell_details.dart';
import 'package:bido/apps/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import '../../apps/auth/login/login_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Map? arguments = settings.arguments as Map?;
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case '/main':
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );
      case '/register':
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
        
      case '/sellDetails':
        return MaterialPageRoute(
          builder: (_) => SellDetails(
            img: arguments!['img'],
            name: arguments['name'],
            description: arguments['description'],
            priceimg: arguments['priceimg'],
            check: arguments['check'],
          ),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text('Page not found'),
          ),
        );
      },
    );
  }
}
