import 'package:flutter/material.dart';
import 'package:movieflex/views/animation/onboarding_page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key, required this.title});

  final String title;

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  double _scale = 0.5;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() async {
    // 1. Petite pause avant de lancer l'animation
    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      setState(() {
        _opacity = 1.0;
        _scale = 1.2;
      });
    }

    // 2. Temps total de l'animation avant de passer à l'accueil (2.5 secondes)
    await Future.delayed(const Duration(seconds: 5));

    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedScale(
          scale: _scale,
          duration: const Duration(seconds: 2),
          curve: Curves.easeOutBack, // Effet de rebond fluide
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Le Logo M stylisé
                const Text(
                  "M",
                  style: TextStyle(
                    fontSize: 120,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                    letterSpacing: -5,
                    shadows: [
                      Shadow(
                        blurRadius: 20.0,
                        color: Colors.red,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // Le nom complet sous le M
                const Text(
                  "MOVIEFLEX",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
