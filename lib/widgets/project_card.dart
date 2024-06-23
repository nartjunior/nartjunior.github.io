import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/project_utils.dart';

import '../constants/colors.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({super.key, required this.project});

  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 290,
      width: 260,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: CustomColor.bgLight2),
      child: InkWell(
        onTap: project.onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // project img
            Image.asset(
              project.image,
              height: 140,
              width: 260,
              fit: BoxFit.cover,
            ),
            // title
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 15, 12, 15),
              child: Text(
                project.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
            // subtitle
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 15),
              child: Text(
                project.subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: CustomColor.whiteSecondary,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
