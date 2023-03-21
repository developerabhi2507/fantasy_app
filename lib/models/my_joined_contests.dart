// To parse this JSON data, do
//
//     final myJoinedContests = myJoinedContestsFromJson(jsonString);

import 'dart:convert';

MyJoinedContests myJoinedContestsFromJson(String str) =>
    MyJoinedContests.fromJson(json.decode(str));

String myJoinedContestsToJson(MyJoinedContests data) =>
    json.encode(data.toJson());

class MyJoinedContests {
  MyJoinedContests({
    required this.status,
    required this.message,
    required this.responsecode,
    required this.data,
  });

  String status;
  String message;
  String responsecode;
  List<Datum> data;

  factory MyJoinedContests.fromJson(Map<String, dynamic> json) =>
      MyJoinedContests(
        status: json["status"],
        message: json["message"],
        responsecode: json["responsecode"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "responsecode": responsecode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.contestId,
    required this.contestName,
    required this.contestTag,
    required this.winners,
    required this.prizePool,
    required this.totalTeam,
    required this.joinTeam,
    required this.entry,
    required this.contestDescription,
    required this.contestNote1,
    required this.contestNote2,
    required this.winningNote,
    required this.matchId,
    required this.type,
    required this.remainingTeam,
    required this.teamCount,
  });

  String contestId;
  String contestName;
  String contestTag;
  String winners;
  String prizePool;
  String totalTeam;
  String joinTeam;
  String entry;
  String contestDescription;
  String contestNote1;
  String contestNote2;
  String winningNote;
  String matchId;
  String type;
  int remainingTeam;
  int teamCount;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        contestId: json["contest_id"],
        contestName: json["contest_name"],
        contestTag: json["contest_tag"],
        winners: json["winners"],
        prizePool: json["prize_pool"],
        totalTeam: json["total_team"],
        joinTeam: json["join_team"],
        entry: json["entry"],
        contestDescription: json["contest_description"],
        contestNote1: json["contest_note1"],
        contestNote2: json["contest_note2"],
        winningNote: json["winning_note"],
        matchId: json["match_id"],
        type: json["type"],
        remainingTeam: json["remaining_team"],
        teamCount: json["team_count"],
      );

  Map<String, dynamic> toJson() => {
        "contest_id": contestId,
        "contest_name": contestName,
        "contest_tag": contestTag,
        "winners": winners,
        "prize_pool": prizePool,
        "total_team": totalTeam,
        "join_team": joinTeam,
        "entry": entry,
        "contest_description": contestDescription,
        "contest_note1": contestNote1,
        "contest_note2": contestNote2,
        "winning_note": winningNote,
        "match_id": matchId,
        "type": type,
        "remaining_team": remainingTeam,
        "team_count": teamCount,
      };
}
