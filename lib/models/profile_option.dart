import 'package:flutter/material.dart';

class ProfileOption {
  final String title;
  final IconData icon;
  final String? subtitle;
  final bool isSwitch;

  ProfileOption({
    required this.title,
    required this.icon,
    this.subtitle,
    this.isSwitch = false,
  });
}
