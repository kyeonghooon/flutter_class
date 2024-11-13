import 'package:flutter/cupertino.dart';

class Item {
  final String name;
  final String image;
  final double price;
  final double rating;
  final int reviewCount;
  final List<Color> colorOptions;
  final IconData icon;

  Item({
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.colorOptions,
    required this.icon,
  });
}