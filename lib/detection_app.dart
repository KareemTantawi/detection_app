import 'package:detecition_app/core/routes/app_route.dart';
import 'package:detecition_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class DetectionApp extends StatelessWidget {
  DetectionApp({super.key, required this.appRouter});
  AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 845),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: Scaffold(),
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.bottomNavBar,
      ),
    );
  }
}
