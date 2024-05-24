import 'package:flutter/material.dart';
import 'package:tugas4tpm/session_manager.dart';
import 'package:tugas4tpm/homepage.dart';
import 'package:tugas4tpm/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 4 TPM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: SessionManager.isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final bool isLoggedIn = snapshot.data ?? false;
            return isLoggedIn ? HomePage() : Login();
          }
        },
      ),
    );
  }
}
