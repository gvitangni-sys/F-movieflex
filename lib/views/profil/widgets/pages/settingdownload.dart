import 'package:flutter/material.dart';

class SettingDownload extends StatefulWidget {
  const SettingDownload({super.key, required this.title});

  final String title;

  @override
  State<SettingDownload> createState() => _SettingDownloadState();
}

class _SettingDownloadState extends State<SettingDownload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          "Download",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
