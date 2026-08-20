import 'package:flutter/material.dart';
import 'package:movieflex/views/animation/widgets/onboarding.dart';
import 'package:movieflex/datas/dummy.dart';
import 'package:movieflex/views/aunthentification/sign_in.dart';
import 'package:movieflex/views/aunthentification/sign_up.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() {
    return OnboardingPageState();
  }
}

class OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext build) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Image.asset("assets/images/brand_movie.png", width: 80),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Privacy",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyLoginpage()),
              );
            },
            child: const Text(
              "Sign In",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              final data = onboardingData[index];
              return Onboarding(
                title: data["title"]!,
                subtitle: data["subtitle"]!,
                image: data["image"]!,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingData.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(right: 8),
                      height: 10,
                      width: _currentIndex == index ? 24 : 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: _currentIndex == index
                            ? Colors.redAccent
                            : Colors.redAccent.withValues(alpha: .3),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Bouton d'action
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MySignUp()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      _currentIndex == onboardingData.length - 1
                          ? "Get started"
                          : "Next",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
