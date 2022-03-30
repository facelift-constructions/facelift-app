// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../premium/new_premium_user.dart';

class GetPremiumButton extends StatelessWidget {
  const GetPremiumButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewPrimiumUserScreen()),
      ),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: Color(0xffff72b9), borderRadius: BorderRadius.circular(32)),
        child: Center(child: Text("Get Premium for free")),
      ),
    );
  }
}
