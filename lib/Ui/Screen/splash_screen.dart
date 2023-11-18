

import 'package:crud_app/Ui/Screen/login_screen.dart';
import 'package:crud_app/Ui/Widget/body_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToLogin();
  }
  void goToLogin() {
    Future.delayed(Duration(seconds: 2))
        .then((value) {
      Navigator.pushAndRemoveUntil(
          context as BuildContext, MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
              (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyBackground(child: Center(
        child: SvgPicture.asset('assets/images/app-logo.svg'),
      ),),

      );
  }
}
