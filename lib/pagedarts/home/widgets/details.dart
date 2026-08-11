import 'package:flutter/material.dart';
import 'package:movieflex/datas/dummy.dart';
import 'package:movieflex/details/widgets/details_sliver.dart';

class DetailsMovies extends StatelessWidget {
  const DetailsMovies(this.movie, {super.key});

  // Nommé au singulier "movie" pour plus de clarté
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: DetailSliverDelegate(
              movie: movie,
              expandedHeight: 400,
              roundedContainerHeight: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 500,
              color: Colors.white,
              child: const Center(child: Text("Détails du film ici...")),
            ),
          ),
        ],
      ),
    );
  }
}
