
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../Screen/edit_profile_screen.dart';
import '../Screen/login_screen.dart';
import '../controller/auth_controller.dart';

class ProfileSummaryCard extends StatelessWidget {
  const ProfileSummaryCard({
    super.key,
    this.enableOnTap = true,
  });

  final bool enableOnTap;

  @override
  Widget build(BuildContext context) {
    Uint8List imageBytes = const Base64Decoder().convert(AuthController.user?.photo ?? '');

    return ListTile(
      onTap: () {
        if (enableOnTap) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditProfileScreen(),
            ),
          );
        }
      },
      leading: CircleAvatar(
        child: AuthController.user?.photo == null
            ? const Icon(Icons.person)
            : ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.memory(
            imageBytes,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        fullName,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        AuthController.user?.email ?? '',
        style: const TextStyle(color: Colors.white),
      ),
      trailing: IconButton(
        onPressed: () async {
          await AuthController.clearAuthData();
          // TODO : solve this warning
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (context) => const LoginScreen()), (
              route) => false);
        },
        icon: const Icon(Icons.logout),
      ),
      tileColor: Colors.green,
    );
  }

  String get fullName {
    return '${AuthController.user?.firstName ?? ''} ${AuthController.user?.lastName ?? ')'}';
  }
}
