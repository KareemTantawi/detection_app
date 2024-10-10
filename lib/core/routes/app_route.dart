import 'package:detecition_app/core/routes/routes.dart';
import 'package:detecition_app/feature/capture/presentation/capture_screen.dart';
import 'package:detecition_app/feature/history/presentation/history_screen.dart';
import 'package:detecition_app/feature/home/presentation/bottom_nav_bar.dart';
import 'package:detecition_app/feature/home/presentation/upload_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.bottomNavBar:
        return MaterialPageRoute(
          builder: (_) => const BottomNavBarScreen(),
        );
      case Routes.captureScreen:
        return MaterialPageRoute(
          builder: (_) => const CaptureScreen(),
        );
      case Routes.historyScreen:
        return MaterialPageRoute(
          builder: (_) => const HistoryScreen(),
        );
      case Routes.uploadScreen:
        return MaterialPageRoute(
          builder: (_) => const UploadScreen(),
        );

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
