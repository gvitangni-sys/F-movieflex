import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieflex/datas/watchlist_data.dart';
import 'package:movieflex/models/movie.model.dart';

class MovieSlide extends StatefulWidget {
  const MovieSlide({super.key, required this.movies});
  final List<Movie> movies;

  @override
  State<MovieSlide> createState() => _MovieSlideState();
}

class _MovieSlideState extends State<MovieSlide> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.movies.length,
      itemBuilder: (context, index, realIndex) {
        final Movie movie = widget.movies[index];

        return Stack(
          children: [
            Positioned.fill(
              child: Image.asset(movie.bgImage, fit: BoxFit.cover),
            ),

            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: .3),
                      Colors.black.withValues(alpha: .95),
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),

            // Superposition du contenu (Titre, Genre, Boutons)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Titre du film
                  Text(
                    movie.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Text(
                    movie.genre,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Les Boutons d'action
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.play_circle_outline_sharp),
                        label: const Text("Play Now"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton.icon(
                        onPressed: () {
                          final added = WatchlistData.addMovie(movie);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                added
                                    ? "${movie.title} added to My List"
                                    : "${movie.title} is already in My List",
                              ),
                              duration: const Duration(seconds: 2),
                              backgroundColor: added
                                  ? Colors.redAccent
                                  : Colors.grey[800],
                            ),
                          );
                        },
                        icon: const Icon(Icons.add),
                        label: const Text("My List"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white24,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
      options: CarouselOptions(
        height: 480,
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        enlargeCenterPage: false,
      ),
    );
  }
}
