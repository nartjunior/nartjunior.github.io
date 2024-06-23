import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/pages/home/bloc/home_bloc.dart';
import 'package:my_portfolio/widgets/contact_section.dart';
import 'package:my_portfolio/widgets/drawer_mobile.dart';
import 'package:my_portfolio/widgets/header_desktop.dart';
import 'package:my_portfolio/widgets/header_mobile.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/main_mobile.dart';
import 'package:my_portfolio/widgets/projects_section.dart';
import 'package:my_portfolio/widgets/skills_desktop.dart';
import 'package:my_portfolio/widgets/skills_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocListener<HomeBloc, HomeState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) async {
          if (state is EmailSentState) {
            Widget okButton = TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            );
            AlertDialog alert = AlertDialog(
              content: const Text("Email is sent. Thank you!"),
              actions: [
                okButton,
              ],
            );

            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return alert;
              },
            );
          }
        },
        child: LayoutBuilder(builder: (context, constraints) {
          return Scaffold(
              key: scaffoldKey,
              backgroundColor: CustomColor.scaffoldBg,
              endDrawer: constraints.maxWidth >= kMinDesktopWidth
                  ? null
                  : DrawerMobile(onNavItemTap: (int navIndex) {
                      // call func
                      scaffoldKey.currentState?.closeEndDrawer();
                      scrollToSection(navIndex);
                    }),
              body: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(key: navbarKeys.first),
                    // Main
                    if (constraints.maxWidth >= kMinDesktopWidth)
                      HeaderDesktop(onNavMenuTap: (int navIndex) {
                        scrollToSection(navIndex);
                      })
                    else
                      HeaderMobile(
                        onLogoTap: () {},
                        onMenuTap: () {
                          scaffoldKey.currentState?.openEndDrawer();
                        },
                      ),
                    if (constraints.maxWidth >= kMinDesktopWidth)
                      const MainDesktop()
                    else
                      const MainMobile(),

                    // Skills
                    Container(
                      key: navbarKeys[1],
                      width: screenWidth,
                      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                      color: CustomColor.bgLight1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // title
                          const Text(
                            "What I can do",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: CustomColor.whitePrimary),
                          ),
                          const SizedBox(
                            height: 50,
                          ),

                          // platforms and skills
                          if (constraints.maxWidth >= kMedDesktopWidth)
                            const SkillsDesktop()
                          else
                            const SkillsMobile(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    // Projects
                    ProjectsSection(
                      key: navbarKeys[2],
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    // Contact
                    ContactSection(
                      key: navbarKeys[3],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ));
        }),
      ),
    );
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      //open a blog page

      return;
    }

    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
