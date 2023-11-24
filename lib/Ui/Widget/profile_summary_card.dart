import 'package:crud_app/Ui/Screen/edit_profile_screen.dart';
import 'package:crud_app/Ui/Screen/login_screen.dart';
import 'package:crud_app/Ui/controller/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'alert_dialogue.dart';

class ProfileSummaryCard extends StatefulWidget {
  const ProfileSummaryCard({
    super.key,
    this.enableOntap = true,
  });
  final bool enableOntap;

  @override
  State<ProfileSummaryCard> createState() => _ProfileSummaryCardState();
}

class _ProfileSummaryCardState extends State<ProfileSummaryCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        tileColor: Colors.green,
        onTap: () {
          if (widget.enableOntap) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfileScreen(),
                ));
          }
        },
        leading: const CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text(fullName,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Text(
          AuthController.user?.email??'',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            MyAlertDialog(context);
          },
          icon: Icon(Icons.logout),
        ));
  }
}


String get fullName{
  return '${AuthController.user?.firstName??''}' +' ' '${ AuthController.user?.lastName??''}';
}

