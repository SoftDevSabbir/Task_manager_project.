import 'package:crud_app/Ui/Screen/forgot_password_screen.dart';
import 'package:crud_app/Ui/Screen/main_bottom_nav_screen.dart';
import 'package:crud_app/Ui/Screen/sign_up_screen.dart';
import 'package:crud_app/Ui/Widget/body_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BodyBackground(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
            Text("Get Started With",style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Emal",
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
             decoration: const InputDecoration(
               hintText: "Password",
             ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainBottom(),));
              }, child: const Icon(Icons.arrow_circle_right_outlined))),
          const SizedBox(height: 48.0),
          Center(child: TextButton(
            child: Text("Forget Password?",style: TextStyle(color: Colors.grey,fontSize: 16),),onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const forgotPasswordScreen(),));
          },
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text("Don't have an account?"),
              TextButton(
                child: Text("Sign Up",style: TextStyle(fontSize: 18),),onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen(),));
              },
              ),
            ],
          )

        ],
      ),
          ))
    );
  }
}
