abstract class ApiEndpoints {
  static const String domainLink = "http://35.79.83.225/cricket/myrest/";

  static const String domainApiLink = "${domainLink}user/";

  // API Links
  static const String appUpdate = "${domainApiLink}update_app";
  static const String matchesRecords = "${domainApiLink}my_match_record";
  static const String usermatchesRecords = "${domainApiLink}mymatch_record";
  static const String contestsList = "${domainApiLink}contest_list";
  static const String userTeamsList = "${domainApiLink}my_team_list";
  static const String teamList = "${domainApiLink}team_list";
  static const String playingHistory = "${domainApiLink}playing_history";
  static const String myJoinedContest = "${domainApiLink}my_join_contest_list";
  static const String myContestsList = "${domainApiLink}joined_contest";
}
