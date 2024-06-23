import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants/colors.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: CustomColor.scaffoldBg,
        body: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  "Chat App",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary),
                ),
                const SizedBox(
                  height: 50,
                ),
                // Hobby projects cards
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Wrap(
                    spacing: 25,
                    runSpacing: 25,
                    children: [
                      Image.asset(
                        "assets/projects/chat_app/chat_app_login.png",
                        width: 260,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "assets/projects/chat_app/chat_app_signup.png",
                        width: 260,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "assets/projects/chat_app/chat_app_home.png",
                        width: 260,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "assets/projects/chat_app/chat_app_message.png",
                        width: 260,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
