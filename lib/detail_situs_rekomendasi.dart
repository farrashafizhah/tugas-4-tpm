import 'package:flutter/material.dart';
import 'package:tugas4tpm/sites_rec_data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tugas4tpm/session_manager.dart';

typedef void RefreshCallback();

void detailSitus(BuildContext context, Sites situs, {RefreshCallback? refreshCallback}) async {
  bool isFavorited = await SessionManager.isFavorite(situs.id);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: Row(
              children: [
                Expanded(
                  child: Text(situs.name),
                ),
                IconButton(
                  onPressed: () async {
                    if (isFavorited) {
                      await SessionManager.removeFavorite(situs.id);
                    } else {
                      await SessionManager.addFavorite(situs);
                    }
                    setState(() {
                      isFavorited = !isFavorited;
                    });
                  },
                  icon: (isFavorited) ? Icon(Icons.favorite) : Icon(Icons.favorite_outline),
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  situs.desc,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        launchURL(situs.sitesUrl);
                      },
                      child: Text('Lihat Situs'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Tutup dialog
                      },
                      child: Text('Tutup'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  ).then((value) {
    if (refreshCallback != null) {
      refreshCallback();
    }
  });
}

Future<void> launchURL(String url) async {
  final Uri _url = Uri.parse(url);
  if (!await launch(_url.toString())) {
    throw "Couldn't launch $_url";
  }
}
