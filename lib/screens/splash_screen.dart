import 'package:flutter/material.dart';

import '../state/auth_controller.dart';
import '../theme/app_theme.dart';
import 'login_screen.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  )..forward();

  late final Animation<double> _iconScale = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.0, 0.55, curve: Curves.easeOutBack),
  );

  late final Animation<double> _iconFade = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
  );

  late final Animation<double> _textFade = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.35, 0.75, curve: Curves.easeOut),
  );

  late final Animation<Offset> _textSlide =
      Tween<Offset>(begin: const Offset(0, 0.15), end: Offset.zero).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.35, 0.75, curve: Curves.easeOutCubic),
        ),
      );

  late final Animation<double> _lineWidth = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.55, 1.0, curve: Curves.easeOutCubic),
  );

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    await Future.wait([
      AuthController.instance.loadPersistedSession(),
      Future.delayed(const Duration(milliseconds: 1600)),
    ]);
    if (!mounted) return;

    final isLoggedIn = AuthController.instance.value;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => isLoggedIn ? const MainScreen() : const LoginScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _iconFade,
              child: ScaleTransition(
                scale: _iconScale,
                child: const Icon(
                  Icons.local_florist_rounded,
                  size: 72,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 22),
            SlideTransition(
              position: _textSlide,
              child: FadeTransition(
                opacity: _textFade,
                child: Text(
                  'Flowee',
                  style: AppTheme.display(
                    fontSize: 34,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            AnimatedBuilder(
              animation: _lineWidth,
              builder: (context, child) {
                return SizedBox(
                  width: 46 * _lineWidth.value,
                  child: const Divider(
                    color: Colors.white54,
                    thickness: 1.2,
                    height: 1,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
