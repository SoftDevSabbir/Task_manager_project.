import 'package:crud_app/Ui/Screen/forgot_password_screen.dart';
import 'package:crud_app/Ui/Screen/login_screen.dart';
import 'package:crud_app/Ui/Screen/pin_verification_screen.dart';
import 'package:crud_app/Ui/Screen/sign_up_screen.dart';
import 'package:crud_app/Ui/Widget/body_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class forgotPasswordScreen extends StatefulWidget {
  const forgotPasswordScreen({super.key});

  @override
  State<forgotPasswordScreen> createState() => _forgotPasswordScreenState();
}

class _forgotPasswordScreenState extends State<forgotPasswordScreen> {
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
                  Text("Enter Your Email",style: Theme.of(context).textTheme.titleLarge),
                  Text("A 6 digit confirmation code will send your email address",style: TextStyle(fontWeight: FontWeight.w300),),
                  const SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Emal",
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PinVerificationScreen(),));
                      }, child: const Icon(Icons.arrow_circle_right_outlined))),
                  const SizedBox(height: 48.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Have an account?"),
                      TextButton(
                        child: Text("Sign In",style: TextStyle(fontSize: 18),),onPressed: (){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen(),), (route) => false);
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
