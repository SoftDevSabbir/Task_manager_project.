import 'package:crud_app/Ui/Screen/forgot_password_screen.dart';
import 'package:crud_app/Ui/Screen/login_screen.dart';
import 'package:crud_app/Ui/Screen/reset_password_screen.dart';
import 'package:crud_app/Ui/Screen/sign_up_screen.dart';
import 'package:crud_app/Ui/Widget/body_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
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
                  Text("Pin Verification",style: Theme.of(context).textTheme.titleLarge),
                  Text("A 6 digit confirmation already send your email address",style: TextStyle(fontWeight: FontWeight.w300),),
                  const SizedBox(height: 16),
                  PinCodeTextField(
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      activeColor: Colors.green,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.white
                    ),
                    animationDuration: Duration(milliseconds: 300),

                    enableActiveFill: true,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {

                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      return true;
                    }, appContext: context,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordScreen(),));
                      }, child: const Text("Verify",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))),
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
