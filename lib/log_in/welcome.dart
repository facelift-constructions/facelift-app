import 'package:facelift_constructions/constants.dart';
import 'package:flutter/material.dart';

import '../dialogs.dart';
import 'phone_auth_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List contentList = [
      welcomeContent(
        context,
        "Manage your house construction",
        "Upload bills, get ideas, track progress, store plans, make payments, and so much more right from your smartphone…",
        "assets/images/1.png",
        "Welcome,",
        true,
      ),
      welcomeContent(
        context,
        "Construction laborers",
        "Appoint, overlook, replace, raise an issue with the on-site laborers in one click from the app.",
        "assets/images/2.png",
        "",
        true,
      ),
      welcomeContent(
        context,
        "Building materials",
        "Over 750 highest quality materials & products to choose from 170+ National & International brands directly at your site…",
        "assets/images/3.png",
        "",
        false,
      ),
    ];

    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        backgroundColor: const Color(0xffebebeb),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  flex: 15,
                  child: PageView.builder(
                      onPageChanged: (value) =>
                          setState(() => currentPage = value),
                      itemCount: 3,
                      itemBuilder: (context, index) => contentList[index])),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PhoneAuthScreen())),
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(32),
                        child: Container(
                          height: 60,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: pinkColor,
                          ),
                          child: const Center(child: Text("Sign Up")),
                        ),
                      ),
                    ),
                    const SizedBox(height: 45),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 500),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: 6,
      decoration: BoxDecoration(
        border: Border.all(color: pinkColor),
        color: currentPage == index
            ? pinkColor
            : const Color.fromRGBO(240, 240, 240, 1),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Widget welcomeContent(BuildContext context, String heading, String text,
      String image, String welcome, bool arrow) {
    return Column(
      children: [
        const Spacer(flex: 2),
        Text(welcome, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.37,
            child: Image.asset(
              image,
              // scale: 0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        arrow
            ? Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipOval(
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(color: Colors.grey.shade400),
                        child: const Icon(Icons.arrow_forward),
                      ),
                    )
                  ],
                ),
              )
            : const SizedBox(height: 35),
        const Spacer(flex: 3),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            heading,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14),
          ),
        ),
        const Spacer(flex: 7),
      ],
    );
  }
}
