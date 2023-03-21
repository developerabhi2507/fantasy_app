import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tempalteflutter/api/apiProvider.dart';
import 'package:tempalteflutter/api/api_endpoints.dart';
import 'package:tempalteflutter/constance/global.dart';
import 'package:tempalteflutter/models/myMatchRecord.dart';
import 'package:tempalteflutter/modules/home/homeScreen.dart';
import 'dart:developer' as devtools;

import 'package:tempalteflutter/modules/register/registerScreen.dart';

import '../models/contestList.dart';
import '../models/my_contest_list.dart';
import '../models/my_joined_contests.dart';
import '../models/playing_history.dart';
import '../models/user_match_fixture_record.dart';
import '../models/user_match_record_live.dart';
import '../models/user_match_result_record.dart';
import '../modules/home/tabScreen.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  MatchRecord? matchRecord;
  UserMatchFixtureRecord? userMatchFixtureRecord;
  UserMatchRecordLive? userMatchRecordLive;
  UserMatchResultRecord? userMatchResultRecord;
  ContestList? contestList;
  PlayingHistory? playingHistory;
  MyJoinedContests? myJoinedContests;
  MyContestsList? myContestsList;

  static const matchesRecordUrl = ApiEndpoints.matchesRecords;
  static const userMatchesRecordUrl = ApiEndpoints.usermatchesRecords;
  static const contestsListUrl = ApiEndpoints.contestsList;
  static const teamListUrl = ApiEndpoints.teamList;
  static const playingHistoryUrl = ApiEndpoints.playingHistory;
  static const myJoinedContestsUrl = ApiEndpoints.myJoinedContest;
  static const myContestsListUrl = ApiEndpoints.myContestsList;
  static const headers = {
    "Content-Type": "application/json",
  };

  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      // Obtain the auth details from the request
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        // Getting user credential
        UserCredential result = await auth.signInWithCredential(authCredential);
        User? user = result.user;
        devtools.log('User Details: $user');
        await matchesRecord();
        await playingHistoryRecord();
        await myJoinedContestsRecord();
        await myContestsListRecord();
        Get.to(TabScreen());
      }
    } on Exception catch (error) {
      devtools.log("...can't login....$error");
    }
  }

  matchesRecord() async {
    var resposne = await Dio().post(matchesRecordUrl,
        options: Options(headers: headers),
        data: jsonEncode({"user_id": "138"}));
    var data = jsonEncode(resposne.data);
    if (resposne.statusCode == 200) {
      devtools.log(resposne.data.toString());
      matchRecord = matchRecordFromJson(data);
    } else {
      devtools.log('statusCode: ${resposne.statusCode}');
      // return null;
    }
  }

  contestsList(String matchId) async {
    var resposne = await Dio().post(contestsListUrl,
        options: Options(headers: headers),
        data: jsonEncode({"match_id": matchId, "type": "All"}));
    var data = jsonEncode(resposne.data);
    if (resposne.statusCode == 200) {
      devtools.log(resposne.data.toString());
      contestList = contestListFromJson(data);
    } else {
      devtools.log('statusCode: ${resposne.statusCode}');
      // return null;
    }
  }

  userMatchesRecordFixture() async {
    var resposne = await Dio().post(userMatchesRecordUrl,
        options: Options(headers: headers),
        data: jsonEncode({"status": "Fixture", "user_id": "138"}));
    var data = jsonEncode(resposne.data);
    if (resposne.statusCode == 200) {
      devtools.log(resposne.data.toString());
      userMatchFixtureRecord = userMatchFixtureRecordFromJson(data);
    } else {
      devtools.log('statusCode: ${resposne.statusCode}');
      // return null;
    }
  }

  userMatchesRecordLive() async {
    var resposne = await Dio().post(userMatchesRecordUrl,
        options: Options(headers: headers),
        data: jsonEncode({"status": "Live", "user_id": "138"}));
    var data = jsonEncode(resposne.data);
    if (resposne.statusCode == 200) {
      devtools.log(resposne.data.toString());
      userMatchRecordLive = userMatchRecordLiveFromJson(data);
    } else {
      devtools.log('statusCode: ${resposne.statusCode}');
      // return null;
    }
  }

  userMatchesRecordResult() async {
    var resposne = await Dio().post(userMatchesRecordUrl,
        options: Options(headers: headers),
        data: jsonEncode({"status": "Result", "user_id": "138"}));
    var data = jsonEncode(resposne.data);
    if (resposne.statusCode == 200) {
      devtools.log(resposne.data.toString());
      userMatchResultRecord = userMatchResultRecordFromJson(data);
    } else {
      devtools.log('statusCode: ${resposne.statusCode}');
      // return null;
    }
  }

  // teamList() async {
  //   var resposne = await Dio().post(teamListUrl,
  //       options: Options(headers: headers),
  //       data: jsonEncode({"matchid":"38","designationid":"0","user_id":"138"}));
  //   var data = jsonEncode(resposne.data);
  //   if (resposne.statusCode == 200) {
  //     devtools.log(resposne.data.toString());
  //     teamList = contestListFromJson(data.toString());
  //   } else {
  //     devtools.log('statusCode: ${resposne.statusCode}');
  //     // return null;
  //   }
  // }

  playingHistoryRecord() async {
    var resposne = await Dio().post(playingHistoryUrl,
        options: Options(headers: headers),
        data: jsonEncode({"user_id": "138"}));
    var data = jsonEncode(resposne.data);
    if (resposne.statusCode == 200) {
      devtools.log(resposne.data.toString());
      playingHistory = playingHistoryFromJson(data);
    } else {
      devtools.log('statusCode: ${resposne.statusCode}');
      // return null;
    }
  }

  myJoinedContestsRecord() async {
    var resposne = await Dio().post(myJoinedContestsUrl,
        options: Options(headers: headers),
        data: jsonEncode({"match_id": "1", "user_id": "138"}));
    var data = jsonEncode(resposne.data);
    if (resposne.statusCode == 200) {
      devtools.log(resposne.data.toString());
      myJoinedContests = myJoinedContestsFromJson(data);
    } else {
      devtools.log('statusCode: ${resposne.statusCode}');
      // return null;
    }
  }

  myContestsListRecord() async {
    var resposne = await Dio().post(myContestsListUrl,
        options: Options(headers: headers),
        data: jsonEncode({"contest_id": "1", "user_id": "138"}));
    var data = jsonEncode(resposne.data);
    if (resposne.statusCode == 200) {
      devtools.log(resposne.data.toString());
      myContestsList = myContestsListFromJson(data);
    } else {
      devtools.log('statusCode: ${resposne.statusCode}');
      // return null;
    }
  }

  Future<void> saveUser() async {
    FirebaseFirestore.instance.collection("users").doc(userdata!.email).set({
      "email": userdata!.email,
      "name": userdata!.name,
      "dob": userdata!.dob,
      "gender": userdata!.gender,
      "state": userdata!.state,
      "city": userdata!.city,
      "referCode": userdata!.referralCode,
      "phoneNo": userdata!.mobileNumber
    });
    devtools.log('.....saved user data.....');
  }
}
