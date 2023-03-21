// To parse this JSON data, do
//
//     final playingHistory = playingHistoryFromJson(jsonString);

import 'dart:convert';

PlayingHistory playingHistoryFromJson(String str) =>
    PlayingHistory.fromJson(json.decode(str));

String playingHistoryToJson(PlayingHistory data) => json.encode(data.toJson());

class PlayingHistory {
  PlayingHistory({
    required this.status,
    required this.message,
    required this.responsecode,
    required this.data,
  });

  String status;
  String message;
  String responsecode;
  Data data;

  factory PlayingHistory.fromJson(Map<String, dynamic> json) => PlayingHistory(
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
    required this.wins,
    required this.series,
    required this.contest,
    required this.matchs,
  });

  String wins;
  String series;
  int contest;
  int matchs;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        wins: json["wins"],
        series: json["series"],
        contest: json["contest"],
        matchs: json["matchs"],
      );

  Map<String, dynamic> toJson() => {
        "wins": wins,
        "series": series,
        "contest": contest,
        "matchs": matchs,
      };
}
