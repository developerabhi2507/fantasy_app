// To parse this JSON data, do
//
//     final myContestsList = myContestsListFromJson(jsonString);

import 'dart:convert';

MyContestsList myContestsListFromJson(String str) =>
    MyContestsList.fromJson(json.decode(str));

String myContestsListToJson(MyContestsList data) => json.encode(data.toJson());

class MyContestsList {
  MyContestsList({
    required this.status,
    required this.message,
    required this.responsecode,
    required this.data,
  });

  String status;
  String message;
  String responsecode;
  Data data;

  factory MyContestsList.fromJson(Map<String, dynamic> json) => MyContestsList(
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
    required this.team1Score,
    required this.team1Over,
    required this.team2Score,
    required this.team2Over,
    required this.team1ScoreSecondInning,
    required this.team1OverSecondInning,
    required this.team2ScoreSecondInning,
    required this.team2OverSecondInning,
    required this.matchStatusNote,
    required this.matchStatus,
    required this.userTeamCount,
    required this.allTeamCount,
    required this.remainingTeam,
    required this.leaderboard,
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
  String team1Score;
  String team1Over;
  String team2Score;
  String team2Over;
  String team1ScoreSecondInning;
  String team1OverSecondInning;
  String team2ScoreSecondInning;
  String team2OverSecondInning;
  String matchStatusNote;
  String matchStatus;
  int userTeamCount;
  int allTeamCount;
  int remainingTeam;
  List<Leaderboard> leaderboard;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        team1Score: json["team1Score"],
        team1Over: json["team1Over"],
        team2Score: json["team2Score"],
        team2Over: json["team2Over"],
        team1ScoreSecondInning: json["team1Score_secondInning"],
        team1OverSecondInning: json["team1Over_secondInning"],
        team2ScoreSecondInning: json["team2Score_secondInning"],
        team2OverSecondInning: json["team2Over_secondInning"],
        matchStatusNote: json["match_status_note"],
        matchStatus: json["match_status"],
        userTeamCount: json["user_team_count"],
        allTeamCount: json["all_team_count"],
        remainingTeam: json["remaining_team"],
        leaderboard: List<Leaderboard>.from(
            json["leaderboard"].map((x) => Leaderboard.fromJson(x))),
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
        "team1Score": team1Score,
        "team1Over": team1Over,
        "team2Score": team2Score,
        "team2Over": team2Over,
        "team1Score_secondInning": team1ScoreSecondInning,
        "team1Over_secondInning": team1OverSecondInning,
        "team2Score_secondInning": team2ScoreSecondInning,
        "team2Over_secondInning": team2OverSecondInning,
        "match_status_note": matchStatusNote,
        "match_status": matchStatus,
        "user_team_count": userTeamCount,
        "all_team_count": allTeamCount,
        "remaining_team": remainingTeam,
        "leaderboard": List<dynamic>.from(leaderboard.map((x) => x.toJson())),
      };
}

class Leaderboard {
  Leaderboard({
    required this.id,
    required this.image,
    required this.teamid,
    required this.rank,
    required this.name,
    required this.userId,
    required this.points,
    required this.teamName,
    required this.winningAmount,
    required this.team,
  });

  String id;
  String image;
  String teamid;
  int rank;
  String name;
  String userId;
  int points;
  String teamName;
  String winningAmount;
  String team;

  factory Leaderboard.fromJson(Map<String, dynamic> json) => Leaderboard(
        id: json["id"],
        image: json["image"],
        teamid: json["teamid"],
        rank: json["rank"],
        name: json["name"],
        userId: json["user_id"],
        points: json["points"],
        teamName: json["TeamName"],
        winningAmount: json["winning_amount"],
        team: json["Team"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "teamid": teamid,
        "rank": rank,
        "name": name,
        "user_id": userId,
        "points": points,
        "TeamName": teamName,
        "winning_amount": winningAmount,
        "Team": team,
      };
}
