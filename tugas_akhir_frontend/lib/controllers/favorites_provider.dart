import 'package:flutter/material.dart';

class FavoritesNotifier extends ChangeNotifier {
  List _ids = [];
  List _favorites = [];

  List get ids => _ids;

  set ids(List newIds) {
    _ids = newIds;
    notifyListeners();
  }

  List get favorites => _favorites;

  set favorites(List newFav) {
    _favorites = newFav;
    notifyListeners();
  }
}
