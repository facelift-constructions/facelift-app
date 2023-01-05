// ignore_for_file: use_rethrow_when_possible

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facelift_constructions/constants.dart';

import '../models/models.dart';

class DatabaseService {
  final CollectionReference userCol =
      FirebaseFirestore.instance.collection('NewUserData');

  // final DocumentReference userData = FirebaseFirestore.instance
  //     .collection('userData')
  //     .doc(number)
  //     .collection('Usr')
  //     .doc('userData');

  final DocumentReference userPremiumDoc =
      FirebaseFirestore.instance.collection('NewPremiumData').doc(userUid);

  // final DocumentReference userPremiumDocCRM =
  //     FirebaseFirestore.instance.collection('premiumData').doc(number);

  // final DocumentReference userPremiumBool =
  //     FirebaseFirestore.instance.collection('userData').doc(number);

  final CollectionReference userHousePlan = FirebaseFirestore.instance
      .collection('housePlan')
      .doc(userUid)
      .collection('photos');

  final CollectionReference userLaborer = FirebaseFirestore.instance
      .collection('laborer')
      .doc(userUid)
      .collection('labor');

  final CollectionReference userHousebill = FirebaseFirestore.instance
      .collection('houseBills')
      .doc(userUid)
      .collection('bills');

  final DocumentReference userHousebillAmount =
      FirebaseFirestore.instance.collection('amount').doc(userUid);

  final DocumentReference userProfileDoc =
      FirebaseFirestore.instance.collection('profilePic').doc(userUid);

  final DocumentReference userSiteSuperviserDoc =
      FirebaseFirestore.instance.collection('supervisor').doc(userUid);

  final DocumentReference userSiteProgressDoc =
      FirebaseFirestore.instance.collection('progress').doc(userUid);

  final DocumentReference userRequestsLabor =
      FirebaseFirestore.instance.collection('RequestsLabor').doc(userUid);

  final DocumentReference userRequestForSuperDoc =
      FirebaseFirestore.instance.collection('RequestsSupervisor').doc(userUid);

  final DocumentReference userRequestForRoomDoc =
      FirebaseFirestore.instance.collection('RequestsRooms').doc(userUid);

  final DocumentReference userRequestForToolsDoc =
      FirebaseFirestore.instance.collection('RequestsTools').doc(userUid);

  final DocumentReference userRequestForRawMatDoc = FirebaseFirestore.instance
      .collection('RequestsRawMaterials')
      .doc(userUid);

  final DocumentReference userComplaintsDoc =
      FirebaseFirestore.instance.collection('Complaints').doc();

  final DocumentReference userRequestsDoc =
      FirebaseFirestore.instance.collection('NewRequests').doc();

  //-----------------------------------------------------------------------------------------

  Future<bool> checkUser() async {
    try {
      var d = await userCol.doc(userUid).get();
      return d.exists;
    } catch (e) {
      throw e;
    }
  }

  Future<void> createRequest(String type, String name) async {
    final time = DateTime.now();
    return await userRequestsDoc.set({
      "uid": userUid,
      "user_number": number,
      "site_name": premiumName,
      "type": type,
      "get": name,
      "created_date": "${time.day}/${time.month}/${time.year}",
      "time": time.millisecondsSinceEpoch,
      "premium user": premiumUser,
    });
  }

  Future<void> updateUserData() async {
    bool exist = await checkUser();
    if (exist) {
      return await userCol.doc(userUid).update({
        "phone": number,
        "uid": userUid,
      });
    } else {
      return await userCol.doc(userUid).set({
        "name": "new User",
        "phone": number,
        "uid": userUid,
      });
    }
  }

  Future<void> updateUserProfil(
      String? name, String? email, String? city, String? state) async {
    final time = DateTime.now();
    return await userCol.doc(userUid).update({
      "name": name,
      "email": email,
      "city": city,
      "state": state,
      "last_login": "${time.day}/${time.month}/${time.year}"
    });
  }

  Future<void> updateUserPremium(bool val) async {
    return await userCol.doc(userUid).update({"premium": val});
  }

  Future<void> updateUserPremiumData(String name, int len, int bre, int area,
      String valueChose, String city, String state) async {
    return await userPremiumDoc.set({
      "name": name,
      "front": len,
      "back": bre,
      "type": valueChose,
      "area": area,
      "city": city,
      "state": state,
      "uid": userUid,
      "phone": number
    });
  }

  // Future<void> updateUserPremiumDataCRM(String name, int len, int bre, int area,
  //     String valueChose, String city, String state) async {
  //   return await userPremiumDocCRM.set({
  //     "name": name,
  //     "front": len,
  //     "back": bre,
  //     "type": valueChose,
  //     "area": area,
  //     "city": city,
  //     "state": state,
  //     "number": number,
  //     "uid": userUid
  //   });
  // }

  Future<void> updateUserProgress() async {
    return await userSiteProgressDoc.set({
      "percentage": "7",
      "value": 0.07,
      "value1": 3,
      "value2": 2,
      "value3": 1,
      "value4": 1,
      "value5": 1,
      "value6": 1,
      "value7": 1,
      "value8": 1,
    });
  }

  Future<void> updateUserHousePlan(String? val, String? url) async {
    return await userHousePlan.doc().set({"name": val, "image": url});
  }

  Future<void> updateUserHouseBill(
    String? name,
    int? amount,
    int? warranty,
    String? url,
    int cDate,
    int cMonth,
    int cYear,
    int uDate,
    int uMonth,
    int uYear,
  ) async {
    return await userHousebill.doc().set({
      "name": name,
      "amount": amount,
      "warranty": warranty,
      "image": url,
      "current_date": cDate,
      "current_month": cMonth,
      "current_year": cYear,
      "user_date": uDate,
      "user_month": uMonth,
      "user_year": uYear,
    });
  }

  Future<void> updateUserHouseBillAmount(int? amount) async {
    return await userHousebillAmount.set({"total": amount});
  }

  Future<void> updateUserProfilePic(String? val) async {
    return await userProfileDoc.set({"url": val});
  }

  Future<void> updateUserComplaint(
      int? time, bool b, String name, String skill, String reason) async {
    return await userComplaintsDoc.set({
      "user_number": number,
      "site_name": premiumName,
      "name": name,
      "skill": skill,
      "reason": reason,
      "time": time,
    });
  }

  //--------------------------------------------------------------------------------------------

  PremiumDataModel _premiumDataFromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> dat = snapshot.data() as Map<String, dynamic>;
    return PremiumDataModel(
      houseName: dat["name"] ?? "House Name",
      length: dat["front"] ?? 0,
      bredth: dat["back"] ?? 0,
      type: dat["type"] ?? "Select",
      area: dat["area"] ?? 0,
      city: dat["city"] ?? "City",
      state: dat["state"] ?? "State",
    );
  }

  Uuser _userDataFromSnapshot(DocumentSnapshot snap) {
    Map<String, dynamic> dat = snap.data() as Map<String, dynamic>;
    return Uuser(
        name: dat["name"] ?? "new user",
        phone: dat["phone"] ?? number,
        email: dat["email"] ?? "",
        city: dat["city"] ?? "",
        state: dat["state"] ?? "");
  }

  UserPremiumBool _userPremiumBoolDataFromSnapshot(DocumentSnapshot snap) {
    Map<String, dynamic> dat = snap.data() as Map<String, dynamic>;
    return UserPremiumBool(premium: dat["premium"] ?? false);
  }

  UserProfilePicModel _userProfilePicFromSnapshot(DocumentSnapshot snap) {
    Map<String, dynamic> dat = snap.data() as Map<String, dynamic>;
    return UserProfilePicModel(url: dat["url"] ?? "");
  }

  SuperviserModel _userSuperviseFromSnapshot(DocumentSnapshot snap) {
    Map<String, dynamic> dat = snap.data() as Map<String, dynamic>;
    return SuperviserModel(
        name: dat["name"] ?? "name",
        age: dat["age"] ?? "age",
        image: dat["image"] ??
            "https://cdn.searchenginejournal.com/wp-content/uploads/2019/08/c573bf41-6a7c-4927-845c-4ca0260aad6b-760x400.jpeg");
  }

  UserProgressModel _userProgressFromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> dat = snapshot.data() as Map<String, dynamic>;
    return UserProgressModel(
      percentage: dat["percentage"] ?? "0",
      overAllvalue: dat["value"] ?? 0.00,
      value1: dat["value1"] ?? 0,
      value2: dat["value2"] ?? 0,
      value3: dat["value3"] ?? 0,
      value4: dat["value4"] ?? 0,
      value5: dat["value5"] ?? 0,
      value6: dat["value6"] ?? 0,
      value7: dat["value7"] ?? 0,
      value8: dat["value8"] ?? 0,
    );
  }

  UserAmountModel _userAmountFromSnapshot(DocumentSnapshot snap) {
    Map<String, dynamic> dat = snap.data() as Map<String, dynamic>;
    return UserAmountModel(total: dat["total"] ?? 0);
  }

  //-------------------------------------------------------------------------------------

  Stream<Uuser> get userDataStream {
    return userCol.doc(userUid).snapshots().map(_userDataFromSnapshot);
  }

  Stream<UserPremiumBool> get userPremiumBoolStream {
    return userCol
        .doc(userUid)
        .snapshots()
        .map(_userPremiumBoolDataFromSnapshot);
  }

  Stream<PremiumDataModel> get userPrmiumDataStream {
    return userPremiumDoc.snapshots().map(_premiumDataFromSnapshot);
  }

  Stream<UserProfilePicModel> get userProfilePicStream {
    return userProfileDoc.snapshots().map(_userProfilePicFromSnapshot);
  }

  Stream<SuperviserModel> get userSuperviserStream {
    return userSiteSuperviserDoc.snapshots().map(_userSuperviseFromSnapshot);
  }

  Stream<UserAmountModel> get userAmountStream {
    return userHousebillAmount.snapshots().map(_userAmountFromSnapshot);
  }

  Stream<UserProgressModel> get userProgressStream {
    return userSiteProgressDoc.snapshots().map(_userProgressFromSnapshot);
  }
}
