import 'package:flutter/material.dart';

class FlowerNetworkImage extends StatelessWidget {
  const FlowerNetworkImage({
    super.key,
    required this.imageUrl,
    required this.fallbackIcon,
    required this.fallbackColor,
    required this.fit,
  });

  final String imageUrl;
  final IconData fallbackIcon;
  final Color fallbackColor;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
