import 'package:flutter/material.dart';
import 'package:movieflex/datas/dummy.dart';
import 'package:movieflex/models/movie.model.dart';
import 'package:movieflex/views/home/widgets/details.dart';

class Newfilms extends StatelessWidget {
  const Newfilms({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. En-tête : Titre + Bouton See All
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "News Films",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Action See All
                },
                child: const Text(
                  "See All",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // 2. Défilement horizontal des Cards
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: newReleases.map((item) {
                final String imagePath = item["cardImage"] ?? "";
                final String badgeText = item["badge"] ?? "";

                // 1. Création de l'objet Movie pour le film sélectionné
                final selectedMovie = Movie(
                  title: imagePath.split('/').last.replaceAll('.jpg', ''),
                  bgImage: imagePath,
                  genre: "Animation / Adventure",
                );

                return Padding(
                  padding: const EdgeInsets.only(right: 14.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        // Image cliquable
                        GestureDetector(
                          onTap: () {
                            // 2. Navigation vers la page de détails au clic
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailsMovies(selectedMovie),
                              ),
                            );
                          },
                          child: Image.asset(
                            imagePath,
                            width: 140,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // Badge Rouge superposé
                        if (badgeText.isNotEmpty)
                          Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                badgeText,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
