// To parse this JSON data, do
//
//     final userMatchRecordLive = userMatchRecordLiveFromJson(jsonString);

import 'dart:convert';

UserMatchRecordLive userMatchRecordLiveFromJson(String str) =>
    UserMatchRecordLive.fromJson(json.decode(str));

String userMatchRecordLiveToJson(UserMatchRecordLive data) =>
    json.encode(data.toJson());

class UserMatchRecordLive {
  UserMatchRecordLive({
    required this.status,
    required this.message,
    required this.responsecode,
    required this.data,
  });

  String status;
  String message;
  String responsecode;
  List<Datum> data;

  factory UserMatchRecordLive.fromJson(Map<String, dynamic> json) =>
      UserMatchRecordLive(
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
    required this.myMatchId,
    required this.teamid1,
    required this.teamid2,
    required this.elevenOut,
    required this.userId,
    required this.myTeamId,
    required this.contestId,
    required this.type,
    required this.matchId,
    required this.time,
    required this.matchStatus,
    required this.matchStarted,
    required this.createdDate,
    required this.modifiedDate,
    this.creditType,
    this.bonusType,
    required this.winningType,
    required this.cancelled,
    required this.contestCount,
    required this.teamCount,
    required this.teamName1,
    required this.teamImage1,
    required this.teamShortName1,
    required this.teamName2,
    required this.teamImage2,
    required this.teamShortName2,
    required this.leagueName,
    required this.team1Score,
    required this.team1Over,
    required this.team2Score,
    required this.team2Over,
    required this.team1ScoreSecondInning,
    required this.team1OverSecondInning,
    required this.team2ScoreSecondInning,
    required this.team2OverSecondInning,
    required this.matchStatusNote,
  });

  String myMatchId;
  String teamid1;
  String teamid2;
  String elevenOut;
  String userId;
  String myTeamId;
  String contestId;
  String type;
  String matchId;
  int time;
  String matchStatus;
  String matchStarted;
  DateTime createdDate;
  DateTime modifiedDate;
  dynamic creditType;
  dynamic bonusType;
  String winningType;
  String cancelled;
  int contestCount;
  int teamCount;
  String teamName1;
  String teamImage1;
  String teamShortName1;
  String teamName2;
  String teamImage2;
  String teamShortName2;
  String leagueName;
  String team1Score;
  String team1Over;
  String team2Score;
  String team2Over;
  String team1ScoreSecondInning;
  String team1OverSecondInning;
  String team2ScoreSecondInning;
  String team2OverSecondInning;
  String matchStatusNote;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        myMatchId: json["my_match_id"],
        teamid1: json["teamid1"],
        teamid2: json["teamid2"],
        elevenOut: json["eleven_out"],
        userId: json["user_id"],
        myTeamId: json["my_team_id"],
        contestId: json["contest_id"],
        type: json["type"],
        matchId: json["match_id"],
        time: json["time"],
        matchStatus: json["match_status"],
        matchStarted: json["matchStarted"],
        createdDate: DateTime.parse(json["created_date"]),
        modifiedDate: DateTime.parse(json["modified_date"]),
        creditType: json["credit_type"],
        bonusType: json["bonus_type"],
        winningType: json["winning_type"],
        cancelled: json["cancelled"],
        contestCount: json["contest_count"],
        teamCount: json["team_count"],
        teamName1: json["team_name1"],
        teamImage1: json["team_image1"],
        teamShortName1: json["team_short_name1"],
        teamName2: json["team_name2"],
        teamImage2: json["team_image2"],
        teamShortName2: json["team_short_name2"],
        leagueName: json["league_name"],
        team1Score: json["team1Score"],
        team1Over: json["team1Over"],
        team2Score: json["team2Score"],
        team2Over: json["team2Over"],
        team1ScoreSecondInning: json["team1Score_secondInning"],
        team1OverSecondInning: json["team1Over_secondInning"],
        team2ScoreSecondInning: json["team2Score_secondInning"],
        team2OverSecondInning: json["team2Over_secondInning"],
        matchStatusNote: json["match_status_note"],
      );

  Map<String, dynamic> toJson() => {
        "my_match_id": myMatchId,
        "teamid1": teamid1,
        "teamid2": teamid2,
        "eleven_out": elevenOut,
        "user_id": userId,
        "my_team_id": myTeamId,
        "contest_id": contestId,
        "type": type,
        "match_id": matchId,
        "time": time,
        "match_status": matchStatus,
        "matchStarted": matchStarted,
        "created_date": createdDate.toIso8601String(),
        "modified_date": modifiedDate.toIso8601String(),
        "credit_type": creditType,
        "bonus_type": bonusType,
        "winning_type": winningType,
        "cancelled": cancelled,
        "contest_count": contestCount,
        "team_count": teamCount,
        "team_name1": teamName1,
        "team_image1": teamImage1,
        "team_short_name1": teamShortName1,
        "team_name2": teamName2,
        "team_image2": teamImage2,
        "team_short_name2": teamShortName2,
        "league_name": leagueName,
        "team1Score": team1Score,
        "team1Over": team1Over,
        "team2Score": team2Score,
        "team2Over": team2Over,
        "team1Score_secondInning": team1ScoreSecondInning,
        "team1Over_secondInning": team1OverSecondInning,
        "team2Score_secondInning": team2ScoreSecondInning,
        "team2Over_secondInning": team2OverSecondInning,
        "match_status_note": matchStatusNote,
      };
}
