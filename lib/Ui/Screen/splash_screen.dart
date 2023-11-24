//
//
// import 'package:crud_app/Ui/Screen/login_screen.dart';
// import 'package:crud_app/Ui/Screen/main_bottom_nav_screen.dart';
// import 'package:crud_app/Ui/Widget/body_background.dart';
// import 'package:crud_app/Ui/controller/auth_controller.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     goToLogin();
//   }
//   void goToLogin() async{
//   final bool isLogedIn=await AuthController.checkAuthState();
//
//     Future.delayed(Duration(seconds: 2))
//         .then((value) {
//       Navigator.pushAndRemoveUntil(
//           context as BuildContext, MaterialPageRoute(
//         builder: (context) =>isLogedIn? const MainBottom():const LoginScreen() //: const MainBottom()
//       ),
//               (route) => false);
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BodyBackground(child: Center(
//         child: SvgPicture.asset('assets/images/app-logo.svg'),
//       ),),
//
//       );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:task_manager/ui/controllers/auth_controller.dart';
// import 'package:task_manager/ui/screens/login_screen.dart';
// import 'package:task_manager/ui/screens/main_bottom_nav_screen.dart';
// import 'package:task_manager/ui/widgets/body_background.dart';

import '../Widget/body_background.dart';
import '../controller/auth_controller.dart';
import 'login_screen.dart';
import 'main_bottom_nav_screen.dart';

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

  Future<void> goToLogin() async {
    final bool isLoggedIn = await AuthController.checkAuthState();

    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => isLoggedIn
                  ? const MainBottom()
                  : const LoginScreen()),
              (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BodyBackground(
          child: Center(
            child: SvgPicture.asset(
              'assets/images/app-logo.svg',
              width: 120,
            ),
          ),
        )
    );
  }
}
