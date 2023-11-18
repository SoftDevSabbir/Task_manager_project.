import 'package:crud_app/Ui/Widget/body_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BodyBackground(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
            Text("Join With Us",style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Emal",
            ),
          ),  TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "First Name",
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Last Name",
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Mobile",
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
             decoration: InputDecoration(
               hintText: "Password",
             ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){}, child: const Icon(Icons.arrow_circle_right_outlined))),
          const SizedBox(height: 48.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text("Already have an account?"),
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
