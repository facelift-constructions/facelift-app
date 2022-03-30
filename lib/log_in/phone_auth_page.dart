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
  var codeChose = "+91";
  bool vis = false;
  List countryCodes = ["+1", "+2", "+3", "+4", "+91", "+92", "+93", "+94"];

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
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: size.width * 0.85,
                  child: const Text("Full Name"),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 50,
                  width: size.width * 0.9,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(15)
                    ],
                    cursorColor: Colors.black,
                    onChanged: (val) => newName = val,
                    decoration: InputDecoration(
                      hintText: "Enter Here...",
                      hintStyle: TextStyle(
                        fontSize: 16,
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
                const SizedBox(height: 30),
                SizedBox(
                  width: size.width * 0.85,
                  child: const Text("Mobile Number"),
                ),
                const SizedBox(height: 5),
                textField(size),
                const SizedBox(height: 50),
                Visibility(
                  visible: vis,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 30,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                          ),
                        ),
                        const Text(
                          "Enter 6 digit OTP",
                          style: TextStyle(fontSize: 16),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Visibility(visible: vis, child: otpField(size)),
                const SizedBox(height: 40),
                Visibility(
                  visible: vis,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Send OTP again in ",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        TextSpan(
                          text: "00:$start",
                          style: TextStyle(fontSize: 16, color: pinkColor),
                        ),
                        const TextSpan(
                          text: " sec ",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Visibility(
                  visible: vis,
                  child: InkWell(
                    onTap: () {
                      authClass
                          .signInwithPhoneNumber(
                              verificationIdFinal, smsCode, context)
                          .whenComplete(() => DatabaseService()
                              .updateUserProfil(
                                  newName == ""
                                      ? "New User"
                                      : capitalize(newName),
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
                      child: const Center(
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
        style: const TextStyle(fontSize: 17),
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
    return SizedBox(
      width: size.width * 0.9,
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 77,
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black12),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              isExpanded: true,
              value: codeChose,
              items: countryCodes.map(
                (valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                },
              ).toList(),
              onChanged: (newValue) {
                setState(() => codeChose = "$newValue");
              },
            ),
          ),
          const SizedBox(width: 3),
          Container(
            height: 50,
            width: size.width * 0.9 - 80,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(24),
            ),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Cannot be Empty";
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
                hintText: "Enter Here...",
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade500,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 14, left: 8),
                suffixIcon: InkWell(
                  onTap: wait
                      ? () => showSnackBar(context, "Wait for timer to finish")
                      : () async {
                          // showSnackBar(
                          //     context, "$codeChose ${phoneController.text}");
                          // setState(() {
                          //   vis = true;
                          // });
                          showSnackBarDuration(context, "Redirecting...", 5);
                          startTimer();
                          setState(() {
                            start = 30;
                            wait = true;
                            vis = true;
                            buttonName = "Resend";
                          });
                          await authClass.verifyPhoneNumber(
                              "$codeChose ${phoneController.text}",
                              context,
                              setData);
                        },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 14, left: 10, right: 10),
                    child: Text(
                      buttonName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void setData(String verificationId) {
    setState(() => verificationIdFinal = verificationId);
    startTimer();
  }
}
