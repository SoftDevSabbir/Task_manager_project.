import 'package:crud_app/Ui/Screen/edit_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileSummaryCard extends StatelessWidget {
  const ProfileSummaryCard({
    super.key,
    this.enableOntap = true,
  });
  final bool enableOntap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (enableOntap) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditProfileScreen(),
              ));
        }
      },
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text("Rabbil Hasan",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      subtitle: Text(
        "rabbil@gmail.com",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      trailing:enableOntap? Icon(Icons.arrow_circle_right_outlined):null,
      tileColor: Colors.green,
    );
  }
}
