import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BilanganPrima extends StatefulWidget {
  const BilanganPrima({super.key});

  @override
  _BilanganPrimaState createState() => _BilanganPrimaState();
}

class _BilanganPrimaState extends State<BilanganPrima>
{
  int? _inputNumber;
  bool? _isPrime;
  bool _isButtonClicked = false;

  void _checkPrime() {
    if (_inputNumber! <= 1 || _inputNumber! > 1000) {
      setState(() {
        _isPrime = false;
      });
      return;
    }

    for (int i = 2; i <= _inputNumber! / 2; i++) {
      if (_inputNumber! % i == 0) {
        setState(() {
          _isPrime = false;
        });
        return;
      }
    }

    setState(() {
      _isPrime = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menentukan Bilangan Prima'),
      ),

      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: 'Masukkan Angka',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
              onChanged: (value) {
                setState(() {
                  _inputNumber = int.tryParse(value);
                  _isButtonClicked = false;
                  _isPrime = null;
                });
              },
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _checkPrime();
                setState(() {
                  _isButtonClicked = true;
                });
              },
              child: Text('Check'),
            ),

            SizedBox(height: 20),
            if (_isButtonClicked && _isPrime != null)
              _inputNumber != null && _isPrime != null
                  ? _inputNumber! < 1 || _inputNumber! > 1000
                  ? Text(
                    'Masukkan angka 1-1000',
                    style: TextStyle(fontSize: 18),
                  )
                  : !(_inputNumber! % 1 == 0)
                  ? Text(
                    'Masukkan bilangan bulat',
                    style: TextStyle(fontSize: 18),
                  )
                  : _isPrime!
                  ? Text(
                    '$_inputNumber adalah bilangan prima',
                    style: TextStyle(fontSize: 18),
                  )
                  : Text(
                    '$_inputNumber bukan bilangan prima',
                    style: TextStyle(fontSize: 18),
                  )
                  : Container(),
          ],
        ),
      ),
    );
  }
}