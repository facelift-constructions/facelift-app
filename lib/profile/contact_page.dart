import 'package:facelift_constructions/profile/pic_menu.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    _launchUrl(String siteUrl) async {

      final url = Uri.parse(siteUrl);

      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: siteUrl=="https://wa.aisensy.com/qHBN8K"? LaunchMode.externalApplication: LaunchMode.platformDefault);
      } else {
        throw 'Could not launch $url';
      }

    }

    return Scaffold(
      backgroundColor: const Color(0xffebebeb),
      appBar: AppBar(
        toolbarHeight: 75,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text("Contact", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black54),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            ProfileMenu(
              name: "Call",
              press: () {
                _launchUrl('tel:7207225725');
              },
              isTrue: true,
            ),
            ProfileMenu(
              name: "WhatsApp",
              press: () {
                _launchUrl('https://wa.aisensy.com/qHBN8K');
              },
              isTrue: true,
            ),
            ProfileMenu(
              name: "Email",
              press: () {
                _launchUrl('mailto:contact@facelift.com');
              },
              isTrue: true,
            ),
            ProfileMenu(
              name: "Instagram",
              press: () {
                _launchUrl(
                    'https://www.instagram.com/facelift.constructions/');
              },
              isTrue: true,
            ),
          ],
        ),
      ),
    );
  }
}
