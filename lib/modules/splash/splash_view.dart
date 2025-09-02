import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/core/constants/assets.dart';
import 'package:news_app/core/routes/page_route_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        PageRouteName.home,
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AppAssets.splashBackground)),
    );
  }
}
