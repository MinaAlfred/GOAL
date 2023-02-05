import 'dart:convert';

class MatchesModel {
  MatchesModel({
    Filters filters,
    ResultSet resultSet,
    Competition competition,
    List<Matches> matches,
  }) {
    _filters = filters;
    _resultSet = resultSet;
    _competition = competition;
    _matches = matches;
  }

  MatchesModel.fromJson(dynamic json) {
    _filters =
        json['filters'] != null ? Filters.fromJson(json['filters']) : null;
    _resultSet = json['resultSet'] != null
        ? ResultSet.fromJson(json['resultSet'])
        : null;
    _competition = json['competition'] != null
        ? Competition.fromJson(json['competition'])
        : null;
    if (json['matches'] != null) {
      _matches = [];
      json['matches'].forEach((v) {
        _matches.add(Matches.fromJson(v));
      });
    }
  }
  Filters _filters;
  ResultSet _resultSet;
  Competition _competition;
  List<Matches> _matches;

  Filters get filters => _filters;
  ResultSet get resultSet => _resultSet;
  Competition get competition => _competition;
  List<Matches> get matches => _matches;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_filters != null) {
      map['filters'] = _filters.toJson();
    }
    if (_resultSet != null) {
      map['resultSet'] = _resultSet.toJson();
    }
    if (_competition != null) {
      map['competition'] = _competition.toJson();
    }
    if (_matches != null) {
      map['matches'] = _matches.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Matches {
  Matches({
    Area area,
    Competition competition,
    Season season,
    num id,
    String utcDate,
    String status,
    num matchday,
    String stage,
    dynamic group,
    String lastUpdated,
    HomeTeam homeTeam,
    AwayTeam awayTeam,
    Score score,
    Odds odds,
    List<Referees> referees,
  }) {
    _area = area;
    _competition = competition;
    _season = season;
    _id = id;
    _utcDate = utcDate;
    _status = status;
    _matchday = matchday;
    _stage = stage;
    _group = group;
    _lastUpdated = lastUpdated;
    _homeTeam = homeTeam;
    _awayTeam = awayTeam;
    _score = score;
    _odds = odds;
    _referees = referees;
  }

  Matches.fromJson(dynamic json) {
    _area = json['area'] != null ? Area.fromJson(json['area']) : null;
    _competition = json['competition'] != null
        ? Competition.fromJson(json['competition'])
        : null;
    _season = json['season'] != null ? Season.fromJson(json['season']) : null;
    _id = json['id'];
    _utcDate = json['utcDate'];
    _status = json['status'];
    _matchday = json['matchday'];
    _stage = json['stage'];
    _group = json['group'];
    _lastUpdated = json['lastUpdated'];
    _homeTeam =
        json['homeTeam'] != null ? HomeTeam.fromJson(json['homeTeam']) : null;
    _awayTeam =
        json['awayTeam'] != null ? AwayTeam.fromJson(json['awayTeam']) : null;
    _score = json['score'] != null ? Score.fromJson(json['score']) : null;
    _odds = json['odds'] != null ? Odds.fromJson(json['odds']) : null;
    if (json['referees'] != null) {
      _referees = [];
      json['referees'].forEach((v) {
        _referees.add(Referees.fromJson(v));
      });
    }
  }
  Area _area;
  Competition _competition;
  Season _season;
  num _id;
  String _utcDate;
  String _status;
  num _matchday;
  String _stage;
  dynamic _group;
  String _lastUpdated;
  HomeTeam _homeTeam;
  AwayTeam _awayTeam;
  Score _score;
  Odds _odds;
  List<Referees> _referees;

  Area get area => _area;
  Competition get competition => _competition;
  Season get season => _season;
  num get id => _id;
  String get utcDate => _utcDate;
  String get status => _status;
  num get matchday => _matchday;
  String get stage => _stage;
  dynamic get group => _group;
  String get lastUpdated => _lastUpdated;
  HomeTeam get homeTeam => _homeTeam;
  AwayTeam get awayTeam => _awayTeam;
  Score get score => _score;
  Odds get odds => _odds;
  List<Referees> get referees => _referees;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_area != null) {
      map['area'] = _area.toJson();
    }
    if (_competition != null) {
      map['competition'] = _competition.toJson();
    }
    if (_season != null) {
      map['season'] = _season.toJson();
    }
    map['id'] = _id;
    map['utcDate'] = _utcDate;
    map['status'] = _status;
    map['matchday'] = _matchday;
    map['stage'] = _stage;
    map['group'] = _group;
    map['lastUpdated'] = _lastUpdated;
    if (_homeTeam != null) {
      map['homeTeam'] = _homeTeam.toJson();
    }
    if (_awayTeam != null) {
      map['awayTeam'] = _awayTeam.toJson();
    }
    if (_score != null) {
      map['score'] = _score.toJson();
    }
    if (_odds != null) {
      map['odds'] = _odds.toJson();
    }
    if (_referees != null) {
      map['referees'] = _referees.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Referees {
  Referees({
    num id,
    String name,
    String type,
    String nationality,
  }) {
    _id = id;
    _name = name;
    _type = type;
    _nationality = nationality;
  }

  Referees.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _type = json['type'];
    _nationality = json['nationality'];
  }
  num _id;
  String _name;
  String _type;
  String _nationality;

  num get id => _id;
  String get name => _name;
  String get type => _type;
  String get nationality => _nationality;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['type'] = _type;
    map['nationality'] = _nationality;
    return map;
  }
}

class Odds {
  Odds({
    String msg,
  }) {
    _msg = msg;
  }

  Odds.fromJson(dynamic json) {
    _msg = json['msg'];
  }
  String _msg;

  String get msg => _msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    return map;
  }
}

class Score {
  Score({
    String winner,
    String duration,
    FullTime fullTime,
    HalfTime halfTime,
  }) {
    _winner = winner;
    _duration = duration;
    _fullTime = fullTime;
    _halfTime = halfTime;
  }

  Score.fromJson(dynamic json) {
    _winner = json['winner'];
    _duration = json['duration'];
    _fullTime =
        json['fullTime'] != null ? FullTime.fromJson(json['fullTime']) : null;
    _halfTime =
        json['halfTime'] != null ? HalfTime.fromJson(json['halfTime']) : null;
  }
  String _winner;
  String _duration;
  FullTime _fullTime;
  HalfTime _halfTime;

  String get winner => _winner;
  String get duration => _duration;
  FullTime get fullTime => _fullTime;
  HalfTime get halfTime => _halfTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['winner'] = _winner;
    map['duration'] = _duration;
    if (_fullTime != null) {
      map['fullTime'] = _fullTime.toJson();
    }
    if (_halfTime != null) {
      map['halfTime'] = _halfTime.toJson();
    }
    return map;
  }
}

class HalfTime {
  HalfTime({
    num home,
    num away,
  }) {
    _home = home;
    _away = away;
  }

  HalfTime.fromJson(dynamic json) {
    _home = json['home'];
    _away = json['away'];
  }
  num _home;
  num _away;

  num get home => _home;
  num get away => _away;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['home'] = _home;
    map['away'] = _away;
    return map;
  }
}

class FullTime {
  FullTime({
    num home,
    num away,
  }) {
    _home = home;
    _away = away;
  }

  FullTime.fromJson(dynamic json) {
    _home = json['home'];
    _away = json['away'];
  }
  num _home;
  num _away;

  num get home => _home;
  num get away => _away;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['home'] = _home;
    map['away'] = _away;
    return map;
  }
}

class AwayTeam {
  AwayTeam({
    num id,
    String name,
    String shortName,
    String tla,
    String crest,
  }) {
    _id = id;
    _name = name;
    _shortName = shortName;
    _tla = tla;
    _crest = crest;
  }

  AwayTeam.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _shortName = json['shortName'];
    _tla = json['tla'];
    _crest = json['crest'];
  }
  num _id;
  String _name;
  String _shortName;
  String _tla;
  String _crest;

  num get id => _id;
  String get name => _name;
  String get shortName => _shortName;
  String get tla => _tla;
  String get crest => _crest;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['shortName'] = _shortName;
    map['tla'] = _tla;
    map['crest'] = _crest;
    return map;
  }
}

class HomeTeam {
  HomeTeam({
    num id,
    String name,
    String shortName,
    String tla,
    String crest,
  }) {
    _id = id;
    _name = name;
    _shortName = shortName;
    _tla = tla;
    _crest = crest;
  }

  HomeTeam.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _shortName = json['shortName'];
    _tla = json['tla'];
    _crest = json['crest'];
  }
  num _id;
  String _name;
  String _shortName;
  String _tla;
  String _crest;

  num get id => _id;
  String get name => _name;
  String get shortName => _shortName;
  String get tla => _tla;
  String get crest => _crest;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['shortName'] = _shortName;
    map['tla'] = _tla;
    map['crest'] = _crest;
    return map;
  }
}

class Season {
  Season({
    num id,
    String startDate,
    String endDate,
    num currentMatchday,
    dynamic winner,
  }) {
    _id = id;
    _startDate = startDate;
    _endDate = endDate;
    _currentMatchday = currentMatchday;
    _winner = winner;
  }

  Season.fromJson(dynamic json) {
    _id = json['id'];
    _startDate = json['startDate'];
    _endDate = json['endDate'];
    _currentMatchday = json['currentMatchday'];
    _winner = json['winner'];
  }
  num _id;
  String _startDate;
  String _endDate;
  num _currentMatchday;
  dynamic _winner;

  num get id => _id;
  String get startDate => _startDate;
  String get endDate => _endDate;
  num get currentMatchday => _currentMatchday;
  dynamic get winner => _winner;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['startDate'] = _startDate;
    map['endDate'] = _endDate;
    map['currentMatchday'] = _currentMatchday;
    map['winner'] = _winner;
    return map;
  }
}

class Competition {
  Competition({
    num id,
    String name,
    String code,
    String type,
    String emblem,
  }) {
    _id = id;
    _name = name;
    _code = code;
    _type = type;
    _emblem = emblem;
  }

  Competition.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _type = json['type'];
    _emblem = json['emblem'];
  }
  num _id;
  String _name;
  String _code;
  String _type;
  String _emblem;

  num get id => _id;
  String get name => _name;
  String get code => _code;
  String get type => _type;
  String get emblem => _emblem;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    map['type'] = _type;
    map['emblem'] = _emblem;
    return map;
  }
}

class Area {
  Area({
    num id,
    String name,
    String code,
    String flag,
  }) {
    _id = id;
    _name = name;
    _code = code;
    _flag = flag;
  }

  Area.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _flag = json['flag'];
  }
  num _id;
  String _name;
  String _code;
  String _flag;

  num get id => _id;
  String get name => _name;
  String get code => _code;
  String get flag => _flag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    map['flag'] = _flag;
    return map;
  }
}

class ResultSet {
  ResultSet({
    num count,
    String first,
    String last,
    num played,
  }) {
    _count = count;
    _first = first;
    _last = last;
    _played = played;
  }

  ResultSet.fromJson(dynamic json) {
    _count = json['count'];
    _first = json['first'];
    _last = json['last'];
    _played = json['played'];
  }
  num _count;
  String _first;
  String _last;
  num _played;

  num get count => _count;
  String get first => _first;
  String get last => _last;
  num get played => _played;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['first'] = _first;
    map['last'] = _last;
    map['played'] = _played;
    return map;
  }
}

class Filters {
  Filters({
    String season,
  }) {
    _season = season;
  }

  Filters.fromJson(dynamic json) {
    _season = json['season'];
  }
  String _season;

  String get season => _season;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['season'] = _season;
    return map;
  }
}

class Match {
  String matchDate;
  List<Matches> matches;

  Match({this.matchDate, this.matches});

  Match.fromJson(dynamic json) {
    matchDate = json['matchDate'];
    if (json['matches'] != null) {
      matches = [];
      json['matches'].forEach((v) {
        matches.add(Matches.fromJson(v));
      });
    }
  }

  static Map<String, dynamic> toMap(Match match) => {
        'matchDate': match.matchDate,
        'matches': match.matches,
      };

  static String encode(List<Match> match) => json.encode(
        match.map<Map<String, dynamic>>((match) => Match.toMap(match)).toList(),
      );

  static List<Match> decode(String match) =>
      (json.decode(match) as List<dynamic>)
          .map<Match>((item) => Match.fromJson(item))
          .toList();
}
