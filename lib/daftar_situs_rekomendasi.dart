import 'package:flutter/material.dart';
import 'package:tugas4tpm/detail_situs_rekomendasi.dart';
import 'package:tugas4tpm/sites_rec_data.dart';

class DaftarSitus extends StatelessWidget {
  const DaftarSitus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Situs Rekomendasi',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: listSites.length,
          itemBuilder: (context, index) {
            final Sites situs = listSites[index];
            return InkWell(
              onTap: () {
                detailSitus(context, situs);
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
        ),
      ),
    );
  }
}
