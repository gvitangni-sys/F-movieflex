import 'package:flutter/material.dart';
import 'package:movieflex/models/movie.model.dart';
import 'package:movieflex/models/profile_option.dart';

final List<Map<String, String>> onboardingData = [
  {
    "title": "Unlimited movies TV shows, and more .",
    "subtitle": "Watch anywhere. Cancel anytime",
    "image": "assets/images/ob1.jpg",
  },
  {
    "title": "There is a plan for every fan",
    "subtitle": r"plans starting at $2.99/month",
    "image": "assets/images/ob2.jpg",
  },
  {
    "title": "Cancel online anytime",
    "subtitle": "join today, no raison to wait",
    "image": "assets/images/ob3.jpg",
  },
];

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

List<Movie> getMovies() {
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

final List<ProfileOption> profileOptions = [
  ProfileOption(
    icon: Icons.person_outline,
    title: "Edit Profile",
    route: "/EdithPage", // Route vers la page de modification
  ),
  ProfileOption(
    icon: Icons.notifications_none,
    title: "Notification",
    route: "/NotifcationPage",
  ),
  ProfileOption(
    icon: Icons.download_outlined,
    title: "Download",
    route: "/SettingDownload",
  ),
  ProfileOption(
    icon: Icons.security,
    title: "Security",
    route: "/SecurityPage",
  ),
  ProfileOption(
    icon: Icons.language,
    title: "Language",
    subtitle: "English (US)",
  ),
  ProfileOption(
    icon: Icons.dark_mode_outlined,
    title: "Dark Mode",
    isSwitch: true,
  ),
  ProfileOption(
    icon: Icons.help_outline,
    title: "Help Center",
    route: "/HelpPage",
  ),
  ProfileOption(
    icon: Icons.lock_outline,
    title: "Privacy Policy",
    route: "/PrivacyPage",
  ),
];

final List<String> downloadCategories = [
  "All Categories",
  "Movie",
  "TV Series",
  "Anime",
  "Documentary",
];

final List<Map<String, String>> movieDownload = [
  {
    "image": "assets/images/Avatar_2.jpg",
    "name": "Avatar",
    "time": "1h 42 min",
    "date": "14 juill",
  },
  {
    "image": "assets/images/cars.jpg",
    "name": "Cars 3",
    "time": "1h 50 min",
    "date": "20 août",
  },
  {
    "image": "assets/images/Zorro.jpg",
    "name": "Zorro",
    "time": "2h 05 min",
    "date": "20 mars",
  },
  {
    "image": "assets/images/Stranger Things-3.jpg",
    "name": "Stranger Things",
    "time": "1h 40 min",
    "date": "14  juin",
  },
  {
    "image": "assets/images/Lion King.jpg",
    "name": "Lion King",
    "time": "2h 10 min",
    "date": "16  sept",
  },
  {
    "image": "assets/images/Tokyo Revengers.jpg",
    "name": "Tokyo Revengers",
    "time": "45 min",
    "date": "20 août",
  },
  {
    "image": "assets/images/Latern.jpg",
    "name": "Green Laterne",
    "time": "1h 55 min",
    "date": "3 mai",
  },
];
