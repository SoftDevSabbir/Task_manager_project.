import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screen/login_screen.dart';
import '../controller/auth_controller.dart';

MyAlertDialog(context,Tittle,sTittle){
  return showDialog(context: context, builder: (context) => Expanded(child: AlertDialog(
    title: Text(Tittle),
    content: Text(sTittle),
    actions: [
      CupertinoButton(
        onPressed: () { },
        child: TextButton(
            onPressed: (){
          Navigator.of(context).pop();
        }, child: Text('No')),
      ),
      CupertinoButton(
        onPressed: () {},
        child: TextButton(onPressed: ()async{
          await AuthController.clearAuthData();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
                  (route) => false);
        },
            child: Text('Yes')),
      ),
    ],
  )),);


}