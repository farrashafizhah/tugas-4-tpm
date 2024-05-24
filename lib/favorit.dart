import 'package:flutter/material.dart';
import 'package:tugas4tpm/detail_situs_rekomendasi.dart';
import 'package:tugas4tpm/sites_rec_data.dart';
import 'package:tugas4tpm/session_manager.dart';

class Favorit extends StatefulWidget {
  const Favorit({Key? key}) : super(key: key);

  @override
  _FavoritState createState() => _FavoritState();
}

class _FavoritState extends State<Favorit> {
  Future<void> _refreshFavoritPage() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder<List<Sites>>(
          future: SessionManager.getFavoriteSites(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final favoriteSites = snapshot.data;
              return ListView.builder(
                itemCount: favoriteSites!.length,
                itemBuilder: (context, index) {
                  final Sites situs = favoriteSites[index];
                  return InkWell(
                    onTap: () {
                      detailSitus(context, situs, refreshCallback: _refreshFavoritPage);
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              situs.imgUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            situs.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
