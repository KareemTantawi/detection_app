import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      // case Routes.onBoardingScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const OnBoardingScreen(),
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No Routes defined for ${setting.name}',
              ),
            ),
          ),
        );
    }
  }
}
