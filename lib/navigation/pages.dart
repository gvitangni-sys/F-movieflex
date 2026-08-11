import 'package:flutter/material.dart';
import 'package:movieflex/pagedarts/List/listpage.dart';
import 'package:movieflex/pagedarts/explore/explore.dart';
import 'package:movieflex/pagedarts/home/widgets/home_screen.dart';

// On utilise un getter pour retourner une nouvelle liste à chaque appel
List<Widget> getAppPages() => [
  const HomeScreen(),
  const ExplorePage(),
  const ListPage(title: "ListPage"),
  const Center(child: Text("Downloads")),
  const Center(child: Text("Profile")),
];
