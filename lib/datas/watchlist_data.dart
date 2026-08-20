import 'package:movieflex/models/movie.model.dart';

class WatchlistData {
  static final List<Movie> myList = [];

  static bool addMovie(Movie movie) {
    if (!myList.any((m) => m.title == movie.title)) {
      myList.add(movie);
      return true; // Ajouté avec succès
    }
    return false; // Déjà présent
  }

  static void removeMovie(Movie movie) {
    myList.removeWhere((m) => m.title == movie.title);
  }
}
