import 'package:flutter/material.dart';
import 'package:movieflex/views/profil/widgets/header.dart';
import 'package:movieflex/views/profil/widgets/input.dart';

class MyProfil extends StatefulWidget {
  const MyProfil({super.key, required this.title});
  final String title;

  @override
  State<MyProfil> createState() => _MyProfilState();
}

class _MyProfilState extends State<MyProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset(
            "assets/images/brand_logo.png",
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [MyHead(), MyInputs()]),
      ),
    );
  }
}
