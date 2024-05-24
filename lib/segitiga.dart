import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Segitiga extends StatefulWidget {
  const Segitiga({super.key});

  @override
  _SegitigaState createState() => _SegitigaState();
}

class _SegitigaState extends State<Segitiga> {
  late TextEditingController _controllerAlas;
  late TextEditingController _controllerTinggi;
  late TextEditingController _controllerSisiA;
  late TextEditingController _controllerSisiB;
  late TextEditingController _controllerSisiC;
  double _luas = 0;
  double _keliling = 0;

  @override
  void initState() {
    super.initState();
    _controllerAlas = TextEditingController();
    _controllerTinggi = TextEditingController();
    _controllerSisiA = TextEditingController();
    _controllerSisiB = TextEditingController();
    _controllerSisiC = TextEditingController();
  }

  @override
  void dispose() {
    _controllerAlas.dispose();
    _controllerTinggi.dispose();
    _controllerSisiA.dispose();
    _controllerSisiB.dispose();
    _controllerSisiC.dispose();
    super.dispose();
  }

  void _hitungLuas() {
    double alas = double.tryParse(_controllerAlas.text) ?? 0;
    double tinggi = double.tryParse(_controllerTinggi.text) ?? 0;

    setState(() {
      _luas = (alas * tinggi) / 2;
    });
  }

  void _hitungKeliling() {
    double sisiA = double.tryParse(_controllerSisiA.text) ?? 0;
    double sisiB = double.tryParse(_controllerSisiB.text) ?? 0;
    double sisiC = double.tryParse(_controllerSisiC.text) ?? 0;

    setState(() {
      _keliling = sisiA + sisiB + sisiC;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Luas dan Keliling Segitiga'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _controllerAlas,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Alas',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _controllerTinggi,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Tinggi',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    _hitungLuas();
                  },
                  child: Text('Hitung Luas'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(0, 40),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Luas: $_luas', textAlign: TextAlign.center),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _controllerSisiA,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Sisi A',
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    border: OutlineInputBorder(),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _controllerSisiB,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Sisi B',
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    border: OutlineInputBorder(),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _controllerSisiC,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Sisi C',
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    border: OutlineInputBorder(),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    _hitungKeliling();
                  },
                  child: Text('Hitung Keliling'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(0, 40),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Keliling: $_keliling', textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
