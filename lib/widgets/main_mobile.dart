import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      height: screenHeight,
      constraints: const BoxConstraints(minHeight: 560),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // avatar img
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(colors: [
                CustomColor.scaffoldBg.withOpacity(0.6),
                CustomColor.scaffoldBg.withOpacity(0.6),
              ]).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: Image.asset(
              "assets/profile1.png",
              width: 200,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // intro message
          const Text(
            "Hi, \nI'm Nart Pacarizi\na Flutter Developer",
            style: TextStyle(
                fontSize: 24,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
              'Always ready to Contribute to Innovative Projects | Focuses on Team Success \nSelf-taught Flutter developer, building user-friendly Android apps. \nExpanding skills with React & Next.js. \nFreelance projects include unit converter, football score app, chat app etc. \nInternship experience on real projects like Apparule & HR App. \nPrev roles: Communication & Sales at Neptun, Web Dev at Llatki). \nExcited for new challenges as a Flutter developer.'),
          // contact btn
          SizedBox(height: 20,),
          SizedBox(
            width: 190,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Get in touch"),
            ),
          ),
        ],
      ),
    );
  }
}
