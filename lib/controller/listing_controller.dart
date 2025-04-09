import 'dart:collection';
import 'package:get/get.dart';

import '../models/listing.dart';

class ListingController extends GetxController {
  final List<Listing> _favListings = [];
  final Map<Listing, int> _quantity = {};
  final Map<Listing, bool> _userFavorite = {};

  UnmodifiableListView<Listing> get listings =>
      UnmodifiableListView(_favListings);

  double get totalPrice => _favListings.fold(
    0,
    (total, current) => total + current.total * _quantity[current]!,
  );

  Map<Listing, bool> get userFavorite => _userFavorite;

  Map<Listing, int> get quantity => _quantity;

  void add(Listing listing) {
    if (_favListings.contains(listing)) {
      _quantity[listing] = _quantity[listing]! + 1;
    } else {
      _userFavorite[listing] = true;
      _quantity[listing] = 1;
      _favListings.add(listing);
    }
    update();
  }

  void remove(Listing listing) {
    if (_favListings.contains(listing)) {
      if (_quantity[listing]! > 1) {
        _quantity[listing] = _quantity[listing]! - 1;
      } else {
        _userFavorite[listing] = false;
        _favListings.remove(listing);
        _quantity.remove(listing);
      }
    }
    update();
  }

  void removeAll() {
    _userFavorite.clear();
    _favListings.clear();
    _quantity.clear();
    update();
  }
}
