// ignore_for_file: prefer_const_constructors

import 'package:facelift_constructions/models/raw.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../dialogs.dart';
import '../../services/databases.dart';

class RawSceen extends StatelessWidget {
  final RawMaterial material;
  const RawSceen({Key? key, required this.material}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double w = 110;
    double h = 100;
    if (size.width < 350) {
      w = 90;
      h = 80;
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 65,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black54),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 250,
                width: size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(material.image, fit: BoxFit.cover),
                ),
              ),
            ),
            Text(
              material.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                material.description,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        material.p1,
                        height: h,
                        width: w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        material.p2,
                        height: h,
                        width: w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        material.p3,
                        height: h,
                        width: w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            InkWell(
              onTap: () {
                final time = DateTime.now().millisecondsSinceEpoch;
                DatabaseService().updateUserRequestRawMaterial(
                    time, true, material.name.replaceAll(' ', ''));

                showSimpleAnimatedDialogBox(
                    context,
                    "Best in quality ${material.name} will be povided",
                    3,
                    "7.png");
              },
              child: Container(
                height: 45,
                width: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: pinkColor,
                ),
                child: Center(child: Text("Get ${material.name}")),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(32),
            //   child: GetPremiumButton(),
            // )
          ],
        ),
      ),
    );
  }
}
