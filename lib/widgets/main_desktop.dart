import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: screenHeight / 1.2,
      constraints: const BoxConstraints(minHeight: 350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // intro message
                const Text(
                  "Hi, I'm a Flutter Developer ",
                  style: TextStyle(
                      fontSize: 30,
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                    ' Always ready to Contribute to Innovative Projects | Focuses on Team Success \n Self-taught Flutter developer, building user-friendly Android apps. \n Expanding skills with React & Next.js. \n Freelance projects include unit converter, football score app, chat app etc. \n Internship experience on real projects like Apparule & HR App. \n Prev roles: Communication & Sales at Neptun, Web Dev at Llatki). \n Excited for new challenges as a Flutter developer.'),
                const SizedBox(height: 30,),
                // contact btn
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Get in touch"),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Image.asset(
                "assets/profile1.png",
                width: screenWidth / 3,
              ),
              const Text(
                " Nart Pacarizi ",
                style: TextStyle(
                    fontSize: 30,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whitePrimary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
