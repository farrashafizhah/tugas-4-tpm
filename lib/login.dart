import 'package:flutter/material.dart';
import 'package:tugas4tpm/daftar_situs_rekomendasi.dart';
import 'package:tugas4tpm/homepage.dart';
import 'package:tugas4tpm/session_manager.dart';
import 'package:tugas4tpm/stopwatch.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = "";
  String password = "";
  bool isLoginSuccess = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _usernameField(),
              _passwordField(),
              _loginButton(context),
            ],
          ),
        )
      ),
    );
  }

  Widget _usernameField() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          onChanged: (value) => username = value,
            decoration: InputDecoration(
              labelText: 'Username',
            ),
        ));
  }

  Widget _passwordField() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          onChanged: (value) => password = value,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
          ),
        ));
  }

  Widget _loginButton(context) {
    return Container(
      child: ElevatedButton(
        onPressed: () async {
          String text = "";
          if (await checkCredentials(username, password)) {
            await SessionManager.setLoggedIn(true);
            setState(() {
              text = "Login Berhasil";
              isLoginSuccess = true;
            });
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else {
            setState(() {
              text = "Login Gagal";
              isLoginSuccess = false;
            });
          }

          SnackBar snackBar = SnackBar(
            content: Text(text),
            backgroundColor: (isLoginSuccess) ? Colors.green : Colors.red,
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text(
          'Login',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}

Future<bool> checkCredentials(String username, String password) async {
  Map<String, String> allowedCredentials = {
    'farras': '123210052',
    'tsania': '123210090',
  };

  return allowedCredentials.containsKey(username) &&
      allowedCredentials[username] == password;
}
