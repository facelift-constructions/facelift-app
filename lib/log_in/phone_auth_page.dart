// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'dart:async';

import 'package:facelift_constructions/constants.dart';
import 'package:facelift_constructions/services/databases.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp_text_field/style.dart';
import 'package:otp_text_field/otp_text_field.dart';

import '../services/auth_service.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({Key? key}) : super(key: key);

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  String smsCode = "";
  int start = 30;
  bool wait = false;
  String buttonName = "Send";
  TextEditingController phoneController = TextEditingController();
  AuthClass authClass = AuthClass();
  String verificationIdFinal = "";
  String newName = "newUser";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.2),
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: size.width * 0.8,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    onChanged: (val) => newName = val,
                    decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      ),
                      contentPadding: const EdgeInsets.only(left: 12),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                textField(size),
                SizedBox(height: 50),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                          margin: EdgeInsets.symmetric(horizontal: 12),
                        ),
                      ),
                      Text(
                        "Enter 6 digit OTP",
                        style: TextStyle(fontSize: 16),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                          margin: EdgeInsets.symmetric(horizontal: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                otpField(size),
                SizedBox(height: 40),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Send OTP again in ",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      TextSpan(
                        text: "00:$start",
                        style: TextStyle(fontSize: 16, color: pinkColor),
                      ),
                      TextSpan(
                        text: " sec ",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    authClass
                        .signInwithPhoneNumber(
                            verificationIdFinal, smsCode, context)
                        .whenComplete(() => DatabaseService().updateUserProfil(
                            newName == "" ? "New User" : capitalize(newName),
                            "",
                            "",
                            ""));
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: pinkColor,
                        borderRadius: BorderRadius.circular(32)),
                    child: Center(
                      child: Text(
                        "Lets Go",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        if (mounted) {
          setState(() {
            timer.cancel();
            wait = false;
          });
        }
      } else {
        if (mounted) {
          setState(() => start--);
        }
      }
    });
  }

  Widget otpField(Size size) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: OTPTextField(
        length: 6,
        width: size.width - 20,
        fieldWidth: 50,
        style: TextStyle(fontSize: 17),
        otpFieldStyle: OtpFieldStyle(
          backgroundColor: Colors.grey.shade300,
          borderColor: Colors.white,
        ),
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldStyle: FieldStyle.underline,
        onChanged: (pin) {
          // print("noCompleted: " + pin);
          setState(() {
            smsCode = pin;
          });
        },
        onCompleted: (pin) {},
      ),
    );
  }

  Widget textField(Size size) {
    return Container(
      height: 50,
      width: size.width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "Number Cannot be Empty";
          } else if (value.length != 10) {
            return "Invalid Mobile Number";
          }
          return null;
        },
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          LengthLimitingTextInputFormatter(10),
          FilteringTextInputFormatter.digitsOnly
        ],
        controller: phoneController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Mobile Number",
          contentPadding: EdgeInsets.only(top: 14, left: 8),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(top: 14, left: 10, right: 10),
            child: Text(
              "+91",
              style: TextStyle(fontSize: 16),
            ),
          ),
          suffixIcon: InkWell(
            onTap: wait
                ? () => showSnackBar(context, "Wait for timer to finish")
                : () async {
                    showSnackBarDuration(context, "Redirecting...", 5);
                    startTimer();
                    setState(() {
                      start = 30;
                      wait = true;
                      buttonName = "Resend";
                    });
                    await authClass.verifyPhoneNumber(
                        "+91 ${phoneController.text}", context, setData);
                  },
            child: Padding(
              padding: const EdgeInsets.only(top: 14, left: 10, right: 10),
              child: Text(
                buttonName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setData(String verificationId) {
    setState(() => verificationIdFinal = verificationId);
    startTimer();
  }
}
