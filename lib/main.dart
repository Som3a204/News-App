import 'package:flutter/material.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/core/routes/page_route_name.dart';
import 'package:news_app/core/theme/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.lightTheme,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: PageRouteName.splash,
    );
  }
}
