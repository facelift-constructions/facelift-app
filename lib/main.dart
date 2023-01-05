import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'models/models.dart';
import 'services/auth_service.dart';
import '../constants.dart';
import 'services/databases.dart';
import 'log_in/welcome.dart';
import 'premium/new_premium_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthClass authClass = AuthClass();

  @override
  void initState() {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    analytics.logEvent(name: 'app_start');
    super.initState();
    checkLogin();
  }

  checkLogin() async {
    String? tokne = await authClass.getPhone();
    String? uid = await authClass.getUid();
    if (tokne != null) {
      setState(() {
        userLogedIn = true;
        number = tokne;
        userUid = uid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (userLogedIn != true) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Facelift Constructions',
        home: WelcomeScreen(),
      );
    } else {
      return StreamBuilder<UserPremiumBool>(
        stream: DatabaseService().userPremiumBoolStream,
        builder: (context, snapshot) {
          if (snapshot.hasData && userLogedIn == true) {
            premiumUser = snapshot.data!.premium;
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Facelift Constructions',
              home: HomePage(),
            );
          } else {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(child: CircularProgressIndicator()),
              ),
            );
          }
        },
      );
    }
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: screens[iindex],
      extendBody: true,
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.symmetric(vertical: 24, horizontal: size.width * 0.225),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.black,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: pinkColor,
            currentIndex: iindex,
            onTap: (val) {
              setState(() {
                val == 2
                    ? premiumUser
                        ? iindex = val
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NewPrimiumUserScreen()))
                    : iindex = val;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.whatshot),
                label: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
