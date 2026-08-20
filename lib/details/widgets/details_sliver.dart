import 'package:flutter/material.dart';
import 'package:movieflex/datas/dummy.dart';
import 'package:movieflex/datas/video.dart';
import 'package:movieflex/details/screens/video_player_screen.dart';
import 'package:movieflex/models/movie.model.dart';
import 'package:video_player/video_player.dart';

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final Movie movie;
  final double expandedHeight;
  final double roundedContainerHeight;

  DetailSliverDelegate({
    required this.movie,
    required this.expandedHeight,
    required this.roundedContainerHeight,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // On délègue à un widget StatefulWidget pour pouvoir gérer le bouton Play et MyList
    return _DetailSliverContent(
      movie: movie,
      expandedHeight: expandedHeight,
      roundedContainerHeight: roundedContainerHeight,
      shrinkOffset: shrinkOffset,
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent =>
      WidgetsBinding.instance.platformDispatcher.views.first.padding.top + 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

// Widget interne qui conserve TOUT les  design + la gestion vidéo/boutons
class _DetailSliverContent extends StatefulWidget {
  final Movie movie;
  final double expandedHeight;
  final double roundedContainerHeight;
  final double shrinkOffset;

  const _DetailSliverContent({
    required this.movie,
    required this.expandedHeight,
    required this.roundedContainerHeight,
    required this.shrinkOffset,
  });

  @override
  State<_DetailSliverContent> createState() => _DetailSliverContentState();
}

class _DetailSliverContentState extends State<_DetailSliverContent> {
  VideoPlayerController? _controller;
  bool isPlaying = false;
  bool isMyList = false;

  @override
  void initState() {
    super.initState();
    // Charge la vidéo depuis le fichier video.dart
    _controller =
        VideoPlayerController.networkUrl(Uri.parse(VideoData.defaultVideoUrl))
          ..initialize().then((_) {
            setState(() {}); // Rafraîchit quand la vidéo est prête
          });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. Image de fond avec effet Hero OU Lecteur Vidéo si on clique sur Play
        Hero(
          tag: widget.movie.title,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: widget.expandedHeight - widget.shrinkOffset,
            child:
                isPlaying &&
                    _controller != null &&
                    _controller!.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  )
                : Image.asset(widget.movie.bgImage, fit: BoxFit.cover),
          ),
        ),

        // 2. TES BOUTONS (Play Now & My List) au-dessus du conteneur arrondi
        Positioned(
          top:
              widget.expandedHeight -
              widget.roundedContainerHeight -
              widget.shrinkOffset -
              60,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Bouton Play
              ElevatedButton.icon(
                onPressed: () {
                  // 1. Récupération de l'URL
                  final String url =
                      VideoData.movieVideos[widget.movie.title] ??
                      VideoData.defaultVideoUrl;

                  // 2. Vérification dans la console
                  print(" Film cliqué : '${widget.movie.title}'");
                  print(" URL sélectionnée : '$url'");

                  // 3. Lancement de la vidéo
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerScreen(
                        videoUrl: url,
                        title: widget.movie.title,
                      ),
                    ),
                  );
                },
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

              // Bouton My List
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    isMyList = !isMyList;
                  });
                },
                icon: Icon(isMyList ? Icons.check : Icons.add),
                label: Text(isMyList ? "In My List" : "My List"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black54,
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
        ),

        // 3. Ton Bouton Retour (exactement ton code)
        Positioned(
          top: MediaQuery.of(context).padding.top + 10,
          left: 20,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
        ),

        // 4. Ton Conteneur arrondi avec la barre rouge (exactement ton code)
        Positioned(
          top:
              widget.expandedHeight -
              widget.roundedContainerHeight -
              widget.shrinkOffset,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: widget.roundedContainerHeight,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Container(
              width: 60,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
