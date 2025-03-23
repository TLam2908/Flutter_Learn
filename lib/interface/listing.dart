import 'package:flutter_1/interface/host.dart';

class Listing {
  final List<String> images;
  final String title;
  final String address;
  final double price;
  final int review;
  final int rating;
  final String date;
  final int total;
  final bool isFavorite;
  final Host host;
  final String description;

  Listing({
    required this.images,
    required this.title,
    required this.address,
    required this.price,
    required this.review,
    required this.rating,
    required this.date,
    required this.total,
    required this.isFavorite,
    required this.host,
    required this.description
  });
}