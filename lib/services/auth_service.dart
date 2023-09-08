import 'dart:developer';

import 'package:facelift_constructions/constants.dart';
import 'package:facelift_constructions/services/databases.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class AuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signOut({required BuildContext context}) async {
    try {
      await _auth.signOut();
      await storage.delete(key: "phone");
      await storage.delete(key: "uid");
      await storage.delete(key: "user_name");
      await storage.delete(key: "usercredential");
      await storage.delete(key: "skip");
      await storage.delete(key: "sip");
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void storeTokenAndData(
      UserCredential userCredential, BuildContext context, String name) async {
    log("storing token and data");
    await storage.write(
      key: "phone",
      value: userCredential.user?.phoneNumber.toString(),
    );
    // print(userCredential.user?.phoneNumber.toString());
    await storage.write(
      key: "uid",
      value: userCredential.user?.uid,
    );
    await storage.write(
      key: "user_name",
      value: name,
    );
    // print(userCredential.user?.uid.toString());
    await storage.write(
      key: "usercredential",
      value: userCredential.toString(),
    );
  }

  Future<String?> getCredential() async {
    return await storage.read(key: "usercredential");
  }

  Future<String?> getUid() async {
    return await storage.read(key: "uid");
  }

  Future<String?> getName() async {
    return await storage.read(key: "user_name");
  }

  Future<String?> getPhone() async {
    return await storage.read(key: "phone");
  }

  Future<void> verifyPhoneNumber(
      String phoneNumber, BuildContext context, Function setData) async {
    verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
      showSnackBar(context, "Verification Completed");
    }

    verificationFailed(FirebaseAuthException exception) {
      showSnackBar(context, exception.toString());
    }

    codeSent(String verificationID, [int? forceResnedingtoken]) {
      showSnackBar(context, "Verification Code sent on the phone number");
      setData(verificationID);
    }

    codeAutoRetrievalTimeout(String verificationID) {
      showSnackBar(context, "Time out");
    }

    try {
      await _auth.verifyPhoneNumber(
        timeout: const Duration(seconds: 120),
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> signInwithPhoneNumber(String verificationId, String smsCode,
      BuildContext context, String name) async {
    try {
      AuthCredential authCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      UserCredential userCredential =
          await _auth.signInWithCredential(authCredential);

      storeTokenAndData(userCredential, context, name);
      number = await getPhone();
      userUid = await getUid();

      await DatabaseService().updateUserData();

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MyApp()),
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
      isLoading = false;
    }
  }
}
