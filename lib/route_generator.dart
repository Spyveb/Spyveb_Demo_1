import 'package:flutter/material.dart';

import 'Pages/PhotoFeedsScreen.dart';
import 'Pages/SocialLoginScreen.dart';
import 'Pages/SplashScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/Splash':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/SocialLoginScreen':
        return MaterialPageRoute(builder: (_) => SocialLoginScreen());
      case '/PhotoFeedsScreen':
        return MaterialPageRoute(builder: (_) => PhotoFeedsScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: SafeArea(
                    child: Text("Route Error !!"),
                  ),
                ));
    }
  }
}
