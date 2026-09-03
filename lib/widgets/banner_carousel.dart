import 'dart:async';

import 'package:flowee_app/models/promo_banner.dart';
import 'package:flowee_app/widgets/banner_slide.dart';
import 'package:flowee_app/widgets/carousel_dots.dart';
import 'package:flutter/material.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key, required this.banners});

  final List<PromoBanner> banners;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  // Page Controller => Mengatur slide mana yg sedang tampil di PageView
  late final PageController _controller = PageController();
  Timer? _timer;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    // -> Menjalankan fungsi didalamny secara berulang ulang.
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted || widget.banners.isEmpty) return;
      final next = (_page + 1) % widget.banners.length;
      _controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  @override
  // Timer harus dicancel saat widget dihancurkan (tidak tampil di layar lagi).
  // Kalau lupa, timer akan mencoba jalan di bg walau carouselny sudah tidak muncul di layar.
  // ini salah satu penyebab umum memory leak di Flutter.
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        SizedBox(
          height: 168,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.banners.length,
            // Dipanggil juga saat pengguna swipe manual, bukan cuma saat digeser otomatis oleh timer supaya titik indikator di bawah selalu sinkron
            onPageChanged: (index) => setState(() => _page = index),
            itemBuilder: (context, index) =>
                BannerSlide(banner: widget.banners[index]),
          ),
        ),
        const SizedBox(height: 10),
        CarouselDots(
          count: widget.banners.length,
          activeIndex: _page,
          activeColor: widget.banners[_page].gradientColors.first,
        ),
      ],
    );
  }
}
