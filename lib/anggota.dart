import 'package:flutter/material.dart';

class Anggota extends StatelessWidget {
  const Anggota({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anggota',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Anggota'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomWidget(
                image: AssetImage('assets/anggota/farras.jpeg'),
                text: 'Farras Hafizhah (123210052)',
              ),
              SizedBox(height: 20), // Spacer
              CustomWidget(
                image: AssetImage('assets/anggota/tsania.jpeg'),
                text: 'Tsania Magistra Rahma Insani'
                    ' (123210090)',

              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  final ImageProvider image;
  final String text;

  CustomWidget({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: image,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 10), // Spacer
        Text(
          text,
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
