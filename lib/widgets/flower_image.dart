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
    return Image.network(
      imageUrl,
      fit: fit,
      width: double.infinity,
      height: double.infinity,
      // Loading flutter
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return _Placeholder(
          color: fallbackColor,
          child: SizedBox(
            width: 22,
            height: 22,
            child: CircularProgressIndicator(
              strokeWidth: 2.2,
              color: fallbackColor,
              value: progress.expectedTotalBytes != null ? progress.cumulativeBytesLoaded / progress. expectedTotalBytes! : null,
              // Flutter tau ukuran total file, maka akan menghitung proses download gambar
              // x => Kembalikan Null
            ),
          ),
        );
      },
      // Error Builder -> Backup if the process fails.
      errorBuilder: (context, error, stackTrace) {
        return _Placeholder(
          color: fallbackColor, 
          child: Icon(fallbackIcon, size: 48, color: fallbackColor)
          );
      },
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.color, required this.child});

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color.withValues(alpha: 0.18),
      alignment: Alignment.center,
      child: child,
    );
  }
}
