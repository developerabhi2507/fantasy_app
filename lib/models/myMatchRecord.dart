// To parse this JSON data, do
//
//     final matchRecord = matchRecordFromJson(jsonString);

import 'dart:convert';

MatchRecord matchRecordFromJson(String str) =>
    MatchRecord.fromJson(json.decode(str));

String matchRecordToJson(MatchRecord data) => json.encode(data.toJson());

class MatchRecord {
  MatchRecord({
    required this.status,
    required this.message,
    required this.responsecode,
    required this.data,
  });

  String status;
  String message;
  String responsecode;
  Data data;

  factory MatchRecord.fromJson(Map<String, dynamic> json) => MatchRecord(
        status: json["status"],
        message: json["message"],
        responsecode: json["responsecode"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "responsecode": responsecode,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.fixtureMatch,
    required this.myMatch,
  });

  List<FixtureMatch> fixtureMatch;
  List<dynamic> myMatch;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        fixtureMatch: List<FixtureMatch>.from(
            json["fixtureMatch"].map((x) => FixtureMatch.fromJson(x))),
        myMatch: List<dynamic>.from(json["myMatch"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "fixtureMatch": List<dynamic>.from(fixtureMatch.map((x) => x.toJson())),
        "myMatch": List<dynamic>.from(myMatch.map((x) => x)),
      };
}

class FixtureMatch {
  FixtureMatch({
    required this.matchId,
    required this.uniqueId,
    required this.competitionId,
    required this.squad,
    required this.tossWinnerTeam,
    required this.winnerTeam,
    required this.teamid1,
    required this.teamid2,
    required this.elevenOut,
    required this.matchStatus,
    required this.matchStarted,
    required this.type,
    required this.time,
    required this.matchDateTime,
    required this.title,
    required this.leagueName,
    required this.refund,
    required this.team1Score,
    required this.team1Over,
    required this.team2Score,
    required this.team2Over,
    required this.team1ScoreSecondInning,
    required this.team1OverSecondInning,
    required this.team2ScoreSecondInning,
    required this.team2OverSecondInning,
    required this.paymentStatus,
    required this.matchStatusNote,
    required this.createdDate,
    required this.modifiedDate,
    required this.cancelled,
    required this.teamName1,
    required this.teamImage1,
    required this.teamShortName1,
    required this.teamName2,
    required this.teamImage2,
    required this.teamShortName2,
  });

  String matchId;
  String uniqueId;
  String competitionId;
  String squad;
  String tossWinnerTeam;
  String winnerTeam;
  String teamid1;
  String teamid2;
  String elevenOut;
  String matchStatus;
  String matchStarted;
  String type;
  int time;
  DateTime matchDateTime;
  String title;
  String leagueName;
  String refund;
  String team1Score;
  String team1Over;
  String team2Score;
  String team2Over;
  String team1ScoreSecondInning;
  String team1OverSecondInning;
  String team2ScoreSecondInning;
  String team2OverSecondInning;
  String paymentStatus;
  String matchStatusNote;
  DateTime createdDate;
  DateTime modifiedDate;
  String cancelled;
  String teamName1;
  String teamImage1;
  String teamShortName1;
  String teamName2;
  String teamImage2;
  String teamShortName2;

  factory FixtureMatch.fromJson(Map<String, dynamic> json) => FixtureMatch(
        matchId: json["match_id"],
        uniqueId: json["unique_id"],
        competitionId: json["competition_id"],
        squad: json["squad"],
        tossWinnerTeam: json["toss_winner_team"],
        winnerTeam: json["winner_team"],
        teamid1: json["teamid1"],
        teamid2: json["teamid2"],
        elevenOut: json["eleven_out"],
        matchStatus: json["match_status"],
        matchStarted: json["matchStarted"],
        type: json["type"],
        time: json["time"],
        matchDateTime: DateTime.parse(json["match_date_time"]),
        title: json["title"],
        leagueName: json["league_name"],
        refund: json["refund"],
        team1Score: json["team1Score"],
        team1Over: json["team1Over"],
        team2Score: json["team2Score"],
        team2Over: json["team2Over"],
        team1ScoreSecondInning: json["team1Score_secondInning"],
        team1OverSecondInning: json["team1Over_secondInning"],
        team2ScoreSecondInning: json["team2Score_secondInning"],
        team2OverSecondInning: json["team2Over_secondInning"],
        paymentStatus: json["payment_status"],
        matchStatusNote: json["match_status_note"],
        createdDate: DateTime.parse(json["created_date"]),
        modifiedDate: DateTime.parse(json["modified_date"]),
        cancelled: json["cancelled"],
        teamName1: json["team_name1"],
        teamImage1: json["team_image1"],
        teamShortName1: json["team_short_name1"],
        teamName2: json["team_name2"],
        teamImage2: json["team_image2"],
        teamShortName2: json["team_short_name2"],
      );

  Map<String, dynamic> toJson() => {
        "match_id": matchId,
        "unique_id": uniqueId,
        "competition_id": competitionId,
        "squad": squad,
        "toss_winner_team": tossWinnerTeam,
        "winner_team": winnerTeam,
        "teamid1": teamid1,
        "teamid2": teamid2,
        "eleven_out": elevenOut,
        "match_status": matchStatus,
        "matchStarted": matchStarted,
        "type": type,
        "time": time,
        "match_date_time": matchDateTime.toIso8601String(),
        "title": title,
        "league_name": leagueName,
        "refund": refund,
        "team1Score": team1Score,
        "team1Over": team1Over,
        "team2Score": team2Score,
        "team2Over": team2Over,
        "team1Score_secondInning": team1ScoreSecondInning,
        "team1Over_secondInning": team1OverSecondInning,
        "team2Score_secondInning": team2ScoreSecondInning,
        "team2Over_secondInning": team2OverSecondInning,
        "payment_status": paymentStatus,
        "match_status_note": matchStatusNote,
        "created_date": createdDate.toIso8601String(),
        "modified_date": modifiedDate.toIso8601String(),
        "cancelled": cancelled,
        "team_name1": teamName1,
        "team_image1": teamImage1,
        "team_short_name1": teamShortName1,
        "team_name2": teamName2,
        "team_image2": teamImage2,
        "team_short_name2": teamShortName2,
      };
}
