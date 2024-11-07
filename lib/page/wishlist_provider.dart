import 'package:flutter/material.dart';
import 'package:ui_13/data/plant_model.dart';

class WishlistProvider with ChangeNotifier {
  final List<Plants> _wishlistItems = [];

  List<Plants> get wishlistItems => _wishlistItems;

  void addToWishlist(Plants plant) {
    _wishlistItems.add(plant);
    notifyListeners(); // อัปเดตผู้ฟังทุกคน
  }

  void removeFromWishlist(Plants plant) {
    _wishlistItems.remove(plant);
    notifyListeners(); // อัปเดตผู้ฟังทุกคน
  }
}
