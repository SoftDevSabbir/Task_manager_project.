import 'package:crud_app/Ui/Screen/main_bottom_nav_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screen/login_screen.dart';
import '../controller/auth_controller.dart';

MyAlertDialog(context, Tittle, sTittle) {
  return showDialog(
    context: context,
    builder: (context) => Expanded(
        child: AlertDialog(
      title: Text(Tittle),
      content: Text(sTittle),
      actions: [
        CupertinoButton(
          onPressed: () {},
          child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No')),
        ),
        CupertinoButton(
          onPressed: () {},
          child: TextButton(
              onPressed: () async {
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
    )),
  );
}

TaskDeleteAlertDialog(context, Tittle, sTittle) {
  return showDialog(
    context: context,
    builder: (context) => Expanded(
        child: AlertDialog(
      title: Text(Tittle),
      content: Text(sTittle),
      actions: [
        CupertinoButton(
          onPressed: () {},
          child: TextButton(
              onPressed: () async {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainBottom()));
              },
              child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Ok',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.green),
                  ))),
        ),
      ],
    )),
  );
}
