import 'package:flutter/material.dart';

class Experience {
  final String title;
  final String company;
  final String period;
  final String description;
  final IconData icon;
  final List<String> achievements;

  Experience({
    required this.title,
    required this.company,
    required this.period,
    required this.description,
    required this.icon,
    required this.achievements,
  });
}
