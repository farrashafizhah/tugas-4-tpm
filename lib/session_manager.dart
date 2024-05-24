import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas4tpm/sites_rec_data.dart';

class SessionManager {
  static final String _isLoggedInKey = 'isLoggedIn';

  static Future<void> setLoggedIn(bool isLoggedIn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, isLoggedIn);
  }

  static Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  static Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static final String _favoriteSitesKey = 'favoriteSites';

  static Future<void> addFavorite(Sites site) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteSites = prefs.getStringList(_favoriteSitesKey) ?? [];
    if (!favoriteSites.contains(site.id)) {
      favoriteSites.add(site.id);
      await prefs.setStringList(_favoriteSitesKey, favoriteSites);
    }
  }

  static Future<void> removeFavorite(String siteId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteSites = prefs.getStringList(_favoriteSitesKey) ?? [];
    if (favoriteSites.contains(siteId)) {
      favoriteSites.remove(siteId);
      await prefs.setStringList(_favoriteSitesKey, favoriteSites);
    }
  }

  static Future<List<String>> getFavoriteIds() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoriteSitesKey) ?? [];
  }

  static Future<List<Sites>> getFavoriteSites() async {
    List<Sites> favorites = [];
    List<String> favoriteIds = await getFavoriteIds();
    favorites.addAll(listSites.where((site) => favoriteIds.contains(site.id)));
    return favorites;
  }

  static Future<bool> isFavorite(String siteId) async {
    final List<String> favoriteIds = await getFavoriteIds();
    return favoriteIds.contains(siteId);
  }
}
