import 'package:flutter/material.dart';
import 'package:movieflex/views/List/listpage.dart';
import 'package:movieflex/views/download_/download.dart';
import 'package:movieflex/views/explore/explore.dart';
import 'package:movieflex/views/home/widgets/home_screen.dart';
import 'package:movieflex/views/profil/profil_page.dart';

// On utilise un getter pour retourner une nouvelle liste à chaque appel
List<Widget> getAppPages() => [
  const HomeScreen(),
  const ExplorePage(),
  const ListPage(title: "ListPage"),
  const DownloadPage(title: "Downloads"),
  const MyProfil(title: " ProfilPage"),
];
