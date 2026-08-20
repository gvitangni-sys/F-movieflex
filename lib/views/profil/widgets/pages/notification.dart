import 'package:flutter/material.dart';

class NotifcationPage extends StatefulWidget {
  const NotifcationPage({super.key, required this.title});

  final String title;

  @override
  State<NotifcationPage> createState() => _NotifcationPageState();
}

class _NotifcationPageState extends State<NotifcationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          "NotifcationPage",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
