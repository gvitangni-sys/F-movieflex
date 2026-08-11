import 'package:flutter/material.dart';
import 'package:movieflex/datas/dummy.dart';
import 'package:movieflex/pagedarts/choice/widget/categoryChip.dart';
import 'package:movieflex/pagedarts/home/homepage.dart';

class MyChoicepage extends StatefulWidget {
  const MyChoicepage({super.key});

  @override
  State<MyChoicepage> createState() => _MyChoicepageState();
}

class _MyChoicepageState extends State<MyChoicepage> {
  // Liste qui stocke les genres sélectionnés par l'utilisateur
  final List<String> selectedInterests = [];

  // Méthode utilitaire pour naviguer vers la page d'accueil
  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MyHomePage(title: "Home Page"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Condition : Vrai si l'utilisateur a sélectionné au moins 3 genres
    final bool canProceed = selectedInterests.length >= 3;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Choose Your Interest",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choose at least 3 interests to get the best movie recommendations. Don't worry you can always change it later.",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),

            // Grille/Liste de puces cliquables
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 12,
                  children: categories.map((category) {
                    final isSelected = selectedInterests.contains(category);
                    return CategoryChip(
                      label: category,
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedInterests.remove(category);
                          } else {
                            selectedInterests.add(category);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 10),
            Row(
              children: [
                // Bouton SKIP
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () {
                        // Permet de passer directement à la page d'accueil
                        _navigateToHome();
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.red[100],
                        side: const BorderSide(color: Colors.transparent),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // Bouton NEXT
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      // Désactivé (null) tant que canProceed n'est pas vrai
                      onPressed: canProceed
                          ? () {
                              _navigateToHome();
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        disabledBackgroundColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text(
                        canProceed
                            ? "Next"
                            : "${3 - selectedInterests.length} more",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: canProceed
                              ? Colors.white
                              : Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
