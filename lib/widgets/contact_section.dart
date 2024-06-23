import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/constants/sns_links.dart';
import 'package:my_portfolio/pages/home/bloc/home_bloc.dart';

import '../constants/colors.dart';
import 'custom_text_field.dart';

import 'dart:js' as js;

class ContactSection extends StatefulWidget {
  const ContactSection({
    super.key,
  });

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          // title
          const Text(
            "Get in touch",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: CustomColor.whitePrimary),
          ),
          const SizedBox(
            height: 50,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
              maxHeight: 150,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= kMinDesktopWidth) {
                  return buildNameEmailFieldDesktop();
                }

                //else
                return buildNameEmailFieldMobile();
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: CustomTextField(
              controller: messageController,
              onChanged: (message) =>
                  context.read<HomeBloc>().add(SaveDataMessageEvent(message)),
              hintText: "Your message",
              maxLines: 16,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // button
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () => context.read<HomeBloc>().add(SaveDataEvent()),
                child: const Text("Get in touch"),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
            ),
            child: const Divider(),
          ),
          const SizedBox(
            height: 15,
          ),
          // SNS icons btn
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.github]);
                },
                child: Image.asset(
                  "github.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.linkedIn]);
                },
                child: Image.asset(
                  "linkedin.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.facebook]);
                },
                child: Image.asset(
                  "facebook.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.instagram]);
                },
                child: Image.asset(
                  "instagram.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.twitter]);
                },
                child: Image.asset(
                  "twitter.png",
                  width: 28,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  BlocBuilder<HomeBloc, HomeState> buildNameEmailFieldDesktop() {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if(state is EmailSentState) {
        nameController.text = "";
        emailController.text = "";
        subjectController.text = "";
        messageController.text = "";
      }

        return Row(
          children: [
            Flexible(
              child: CustomTextField(
                onChanged: (name) =>
                    context.read<HomeBloc>().add(SaveDataNameEvent(name)),
                controller: nameController,
                hintText: "Your name",
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Flexible(
              child: CustomTextField(
                onChanged: (email) =>
                    context.read<HomeBloc>().add(SaveDataEmailEvent(email)),
                controller: emailController,
                hintText: "Your email",
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Flexible(
              child: CustomTextField(
                onChanged: (subject) =>
                    context.read<HomeBloc>().add(SaveDataSubjectEvent(subject)),
                controller: subjectController,
                hintText: "Your subject",
              ),
            ),
          ],
        );
      },
    );
  }

  Column buildNameEmailFieldMobile() {
    return Column(
      children: [
        Flexible(
          child: CustomTextField(
            controller: nameController,
            onChanged: (subject) =>
                context.read<HomeBloc>().add(SaveDataNameEvent(subject)),
            hintText: "Your name",
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Flexible(
          child: CustomTextField(
            controller: emailController,
            onChanged: (subject) =>
                context.read<HomeBloc>().add(SaveDataEmailEvent(subject)),
            hintText: "Your email",
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Flexible(
          child: CustomTextField(
            controller: subjectController,
            onChanged: (subject) =>
                context.read<HomeBloc>().add(SaveDataSubjectEvent(subject)),
            hintText: "Your subject",
          ),
        ),
      ],
    );
  }
}
