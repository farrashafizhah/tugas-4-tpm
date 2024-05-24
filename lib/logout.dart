import 'package:flutter/material.dart';
import 'package:tugas4tpm/homepage.dart';
import 'package:tugas4tpm/login.dart';
import 'package:tugas4tpm/session_manager.dart';

class LogoutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Logout'),
      content: Text('Apakah Anda yakin ingin logout?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: Text('Batal'),
        ),
        TextButton(
          onPressed: () async {
            await SessionManager.logout(); // Panggil fungsi logout dari session_manager.dart
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Login()), // Pindah ke halaman login dan hapus semua halaman di belakangnya
                  (route) => false,
            );
          },
          child: Text('Ya'),
        ),
      ],
    );
  }
}