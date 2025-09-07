import 'package:flutter/material.dart';
import 'package:news_app/core/routes/page_route_name.dart';
import 'package:news_app/modules/home/view/home_view.dart';
import 'package:news_app/modules/splash/splash_view.dart';

abstract class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.splash:
        return MaterialPageRoute(
          builder: (BuildContext _) => SplashView(),
          settings: settings,
        );
      case PageRouteName.home:
        return MaterialPageRoute(
          builder: (BuildContext _) => HomeView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (BuildContext _) => SplashView(),
          settings: settings,
        );
    }
  }
}
