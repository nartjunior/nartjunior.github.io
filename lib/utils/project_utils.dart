import 'package:flutter/material.dart';

import '../projects/chat_app.dart';
import '../projects/score_update.dart';
import '../projects/shopping_app.dart';
import '../projects/unit_conversion.dart';

class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final Function() onTap;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
}

// HOBBY PROJECTS
List<ProjectUtils> hobbyProjectUtils(BuildContext context) {
  return [
    ProjectUtils(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ScoreUpdate())),
      image: 'assets/projects/score_update/score_update.png',
      title: 'Score Update',
      subtitle:
          'This is a football application that displays live game scores.',
    ),
    ProjectUtils(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const UnitConversion())),
      image: 'assets/projects/unit_conversion/unit_conversion.png',
      title: 'Unit Conversion',
      subtitle:
          'This is a math application to convert between commonly used units.',
    ),
    ProjectUtils(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ChatApp())),
      image: 'assets/projects/chat_app/chat_app.png',
      title: 'Chat App',
      subtitle: 'This is a chat application.',
    ),
    ProjectUtils(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ShoppingApp())),
      image: 'assets/projects/shopping_app/shopping_app.png',
      title: 'Shopping App',
      subtitle: 'This is a shopping application.',
    ),
  ];
}
