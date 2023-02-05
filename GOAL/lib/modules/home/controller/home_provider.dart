import 'dart:async';
import 'dart:convert';
import 'package:goal/constants/widget/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:goal/constants/appColors.dart';
import 'package:goal/constants/utils/dateTime_parser.dart';
import 'package:goal/modules/home/api/getMatches_api.dart';
import 'package:goal/modules/home/model/matches_model.dart';
import 'package:connectivity/connectivity.dart';

class HomeProvider with ChangeNotifier {
  List<String> datesList = [];
  List<Matches> matches = [];
  List<Match> matchList = [];
  bool isMatchesFetching = false, noNetworkConnection = false;

  /// get matches from api function:
  Future getMatches() async {
    List<Matches> matchesData = [];
    matches.clear();
    isMatchesFetching = true;
    notifyListeners();
    var response = await GetMatchesApi().getMatches();
    notifyListeners();
    var data = jsonDecode(response);
    if (data != null) {
      var matchData = data['matches'];
      matchData.forEach((v) {
        Matches m = Matches.fromJson(v);
        matchesData.add(m);
      });
      matches = matchesData;
    }

    for (var x = 0; x < matches.length; x++) {
      String matchDate =
          '${DateTimeHelper().dayNameParser(matches[x].utcDate)}-${DateTimeHelper().dateParser(matches[x].utcDate)}';
      datesList.add(matchDate);
      datesList = datesList.toSet().toList();
    }

    for (var i = 0; i < datesList.length; i++) {
      List<Matches> mat = [];
      mat.addAll(matches.where((element) =>
          DateTimeHelper().dateParser(element.utcDate) ==
          datesList[i].split('-').last));
      Match match = Match(matchDate: datesList[i], matches: mat);
      matchList.add(match);
      final ids = Set();
      matchList.retainWhere((x) => ids.add(x.matches));
    }

    final prefs = await SharedPreferences.getInstance();
    final String stringMatchList = Match.encode(matchList);
    await prefs.setString('matchesList', stringMatchList);

    isMatchesFetching = false;
    notifyListeners();
  }

  /// get matches from local storage function:
  getMatchesFromLocalShared() async {
    isMatchesFetching = true;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    final String matchesString = prefs.getString('matchesList');
    matchList = Match.decode(matchesString);
    isMatchesFetching = false;
    notifyListeners();
  }

  /// check network connection function:
  connectNetWork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      await getMatches();
    } else {
      noNetworkConnection = true;
      notifyListeners();
      MyToast('No Internet Connection');
      await getMatchesFromLocalShared();
    }
  }

  /// get matches day "EEEE" format function:
  String getMatchDay(int index) {
    return matchList[index].matchDate.split('-').first;
  }

  /// get matches date "dd MMM yyyy" format function:
  String getMatchDate(int index) {
    return matchList[index].matchDate.split('-').last;
  }

  /// get match status color function:
  Color getMatchStatusColor(status) {
    Color statusColor;
    if (status == 'FINISHED') {
      statusColor = MyColors.finishedStatusColor;
    } else if (status == 'CANCELED') {
      statusColor = MyColors.cancelledStatusColor;
    } else if (status == 'NOTSTARTED') {
      statusColor = MyColors.notStartedStatusColor;
    } else if (status == 'TIMED') {
      statusColor = MyColors.timedStatusColor;
    } else {
      statusColor = MyColors.greenColor;
    }
    return statusColor;
  }

  /// get match score function:
  String getMatchScore(int index, int matchIndex) {
    if (matchList[index].matches[matchIndex].score.fullTime.home != null) {
      return '${matchList[index].matches[matchIndex].score.fullTime.home} - ${matchList[index].matches[matchIndex].score.fullTime.away}';
    } else if (matchList[index].matches[matchIndex].status.toUpperCase() != 'CANCELED') {
      return '0 - 0';
    } else {
      return ' - ';
    }
  }

  /// get is match today or not function:
  bool isMatchTodayOrNot(int index) {
    if (matchList[index].matchDate.split('-').last ==
        DateTimeHelper().dateParser(DateTime.now().toString())) {
      return true;
    } else {
      return false;
    }
  }

  /// get match start time function:
  String getMatchStartTime(int index, int matchIndex) {
    return DateTimeHelper().timeParser(
      matchList[index].matches[matchIndex].utcDate,
    );
  }
}
