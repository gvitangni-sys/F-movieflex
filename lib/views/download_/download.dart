import 'package:flutter/material.dart';
import 'package:movieflex/views/download_/widgets/category.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key, required this.title});
  final String title;

  @override
  State<DownloadPage> createState() => DownloadPageState();
}

class DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset(
            "assets/images/brand_logo.png",
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(children: [DownloadSection()]),
      ),
    );
  }
}
