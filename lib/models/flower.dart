import 'package:flutter/material.dart';

// Property
class Flower {
  final String id;
  final String name;
  final String category;
  final double price;
  final double rating;
  final String description;
  final String imageUrl;
  final IconData icon;
  final Color color;

  // Constructur
  Flower({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.description,
    required this.imageUrl,
    required this.icon,
    required this.color
  });

}
