import 'package:flutter/material.dart';
import 'package:tugas4tpm/anggota.dart';
import 'package:tugas4tpm/bantuan.dart';
import 'package:tugas4tpm/bil_prima.dart';
import 'package:tugas4tpm/favorit.dart';
import 'package:tugas4tpm/logout.dart';
import 'package:tugas4tpm/segitiga.dart';
import 'package:tugas4tpm/daftar_situs_rekomendasi.dart';
import 'package:tugas4tpm/stopwatch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late final List;
  Widget _halamanTerpilih(int index) {
    switch (index) {
      case 0:
        return MenuUtama();
      case 1:
        return StopWatch();
      case 2:
        return Bantuan();
      case 3:
        return LogoutDialog();
      default:
        return MenuUtama();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
          centerTitle: true,
        ),
        body: _halamanTerpilih(_selectedIndex), // Menampilkan halaman terpilih
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timer),
              label: 'Stopwatch',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help),
              label: 'Help',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'Logout',
            ),

          ],
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(color: Colors.deepPurple),
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class MenuUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MenuButton('Daftar Anggota', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Anggota()),
            );
          }),
          MenuButton('Bilangan Prima', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BilanganPrima()),
            );
          }),
          MenuButton('Luas dan Keliling Segitiga', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Segitiga()),
            );
          }),
          MenuButton('Situs Rekomendasi', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DaftarSitus()),
            );
          }),
          MenuButton('Favorite', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Favorit()),
            );
          }),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  MenuButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}





