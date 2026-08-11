final List<String> categories = [
  "Adventure",
  "Drama",
  "Comedy",
  "Super-Hero",
  "Action",
  "Sci-Fi",
  "Horror",
  "Romance",
  "Animation",
  "Thriller",
  "Fantasy",
  "Mystery",
  "Crime",
  "History",
  "War",
  "Western",
  "Musical",
  "Documentary",
  "Family",
  "Cyberpunk",
  "Post-Apocalyptic",
  "Slasher",
  "Zombie",
  "Film Noir",
  "Martial Arts",
  "Survival",
  "Kaiju",
];

final cardData = [
  {"cardImage": "assets/images/Avatar.jpg", "badge": "TOP 1"},
  {"cardImage": "assets/images/Lion King.jpg", "badge": "TOP 3"},
  {"cardImage": "assets/images/Harry Potter.jpg", "badge": "TOP 2"},
  {"cardImage": "assets/images/ob3.jpg", "badge": "TOP 3"},
];
final newReleases = [
  {"cardImage": "assets/images/Moana.jpg", "badge": "TOP 1"},
  {"cardImage": "assets/images/Zootopia.jpg", "badge": "TOP 2"},
  {"cardImage": "assets/images/Alvin and the Chipmunks.jpg", "badge": "TOP 3"},
  {"cardImage": "assets/images/Blue Beetle.jpg", "badge": "TOP 3"},
];

class Movie {
  final String title;
  final String bgImage;
  final String? icon;
  final String genre;
  final num? download;
  final num? reviews;
  final String? description;
  final String? videoUrl;
  final List<String>? images;

  Movie({
    required this.title,
    required this.bgImage,
    this.icon,
    required this.genre,
    this.download,
    this.reviews,
    this.description,
    this.videoUrl,
    this.images,
  });

  static List<Movie> getMovies() {
    return [
      Movie(
        title: "STRANGER THINGS",
        bgImage: "assets/images/Stranger things.jpg",
        icon: "icon",
        genre: "Adventure, SCI-Fi, Horror",
        download: 320,
        reviews: 200,
        description:
            "Quand un jeune garçon disparaît, une petite ville découvre un mystère impliquant des expériences secrètes, des forces surnaturelles terrifiantes et une étrange fillette.",
        images: [
          "assets/images/Stranger Things-2.jpg",
          "assets/images/Stranger Things-3.jpg",
          "assets/images/Stranger Things-4.jpg",
        ],
      ),
      Movie(
        title: "SPIDER-MAN",
        bgImage: "assets/images/bgI.jpg",
        icon: "icon",
        genre: "Adventure, Action & SCI-Fi",
        download: 320,
        reviews: 200,
        description:
            "Mordument piqué par une araignée génétiquement modifiée, un étudiant ordinaire acquiert des pouvoirs surhumains qu'il va utiliser pour combattre le crime et protéger sa ville.",
        images: [
          "assets/images/SPM-2.jpg",
          "assets/images/SPM-4.jpg",
          "assets/images/bgI.jpg",
        ],
      ),
      Movie(
        title: "GAME OF THRONES",
        bgImage: "assets/images/GameOfthrone.jpg",
        icon: "icon",
        genre: "Fantasy & Sci-Fi, Drama, Magic",
        download: 500,
        reviews: 300,
        description:
            "Neuf familles nobles s'affrontent pour le contrôle de la terre de Westeros, tandis qu'un ancien ennemi revient après avoir été endormi pendant des milliers d'années.",
        images: [
          "assets/images/Daenerys Targaryen _ Game of thrones.jpg",
          "assets/images/Game of Thrones II.jpg",
          "assets/images/GameOfthrone.jpg",
        ],
      ),
    ];
  }
}
