import 'package:crud_app/Ui/Widget/body_background.dart';
import 'package:crud_app/Ui/Widget/snack_message.dart';
import 'package:crud_app/data_network_caller/network_caller.dart';
import 'package:crud_app/data_network_caller/utility/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data_network_caller/network_reponse.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEControler = TextEditingController();
  final TextEditingController _first_NameTEControler = TextEditingController();
  final TextEditingController _lastNameTEControler = TextEditingController();
  final TextEditingController _mobileTEControler = TextEditingController();
  final TextEditingController _passwordTEControler = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _signUpProgress=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BodyBackground(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 80),
                      Text("Join With Us",
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _emailTEControler,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Emal",
                        ),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return "Enter Your valid email";
                          }
                          if (!isValidating(value!,
                              r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _first_NameTEControler,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "First Name",
                        ),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return "Enter Your First Name";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _lastNameTEControler,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Last Name",
                        ),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return "Enter Your Last Name";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _mobileTEControler,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Mobile",
                        ),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return "Enter Your Mobile Number";
                          }
                          if (value?.length == 12) {
                            return "Enter 11 Digit Number";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _passwordTEControler,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                        ),
                        validator: (String? value) {
                          if (value?.isEmpty ?? true && value!.length < 6) {
                            return "Enter a valid password";
                          }
                          if (value!.length < 6) {
                            return "password should be minimum 6 charecter";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: Visibility(
                            visible: _signUpProgress==false,
                            replacement: Center(child: CircularProgressIndicator()),
                            child: ElevatedButton(
                                onPressed: (){
                                _signUp();
                                },
                                child: const Icon(Icons.arrow_circle_right_outlined)),
                          )),
                      const SizedBox(height: 48.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Already have an account?"),
                          TextButton(
                            child: Text(
                              "Sign In",
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                      (route) => false);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )));
  }

  Future<void>_signUp()async{
    if (_formKey.currentState!.validate()) {
      _signUpProgress=true;
      if(mounted){
        setState(() {

        });
      }
      final NetworkResponse response = await NetworkCaller()
          .PostRequest(Urls.registration, body: {
        "email": _emailTEControler.text.trim(),
        "firstName": _first_NameTEControler.text.trim(),
        "lastName": _lastNameTEControler.text.trim(),
        "mobile": _mobileTEControler.text.trim(),
        "password": _passwordTEControler.text,
      });
      _signUpProgress=false;
      if(mounted){
        setState(() {

        });
      }
      if (response.isSuccess) {
        _ClearTextField();
        if (mounted) {
          showSnackMessage(
              context, "Account Creation Success!");
        }
      } else
            (mounted) {
          showSnackMessage(context,
              "Account Creation Faild! Try Again", true);
        };
    }
  }

  void _ClearTextField(){
    _emailTEControler.clear();
    _first_NameTEControler.clear();
    _lastNameTEControler.clear();
    _mobileTEControler.clear();
    _passwordTEControler.clear();
  }

  @override
  void dispose() {
    _emailTEControler.dispose();
    _first_NameTEControler.dispose();
    _lastNameTEControler.dispose();
    _mobileTEControler.dispose();
    _passwordTEControler.dispose();
    super.dispose();
  }
}

bool isValidating(String email, dynamic charecter) {
  // Basic email validation
  String emailRegex = charecter;
  RegExp regex = RegExp(emailRegex);
  return regex.hasMatch(email);
}
