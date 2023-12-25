class Standing {
  List<Items>? items;

  Standing({this.items});

  Standing.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((e) {
        items!.add(Items.fromJson(e));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  Standings? standings;

  Items({
    this.standings,
  });

  Items.fromJson(Map<String, dynamic> json) {
    standings = json['standings'] != null
        ? Standings.fromJson(json['standings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (standings != null) {
      data['standings'] = standings!.toJson();
    }
    return data;
  }
}

class Standings {
  List<Tables>? tables;

  Standings({this.tables});

  Standings.fromJson(Map<String, dynamic> json) {
    if (json['tables'] != null) {
      tables = <Tables>[];
      json['tables'].forEach((v) {
        tables!.add(Tables.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tables != null) {
      data['tables'] = tables!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tables {
  List<Rows>? rows;

  Tables({this.rows});

  Tables.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rows != null) {
      data['rows'] = rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rows {
  int? points;
  int? position;
  int? played;
  int? won;
  int? drawn;
  int? lost;
  int? goalsFor;
  int? goalsAgainst;
  String? positionChange;
  String? goalDifference;
  List<String>? recentForm;
  String? crestUrl;
  int? clubId;
  String? clubName;
  String? clubShortName;
  bool? featuredTeam;
  bool? cutLine;

  Rows(
      {this.points,
      this.position,
      this.played,
      this.won,
      this.drawn,
      this.lost,
      this.goalsFor,
      this.goalsAgainst,
      this.positionChange,
      this.goalDifference,
      this.recentForm,
      this.crestUrl,
      this.clubId,
      this.clubName,
      this.clubShortName,
      this.featuredTeam,
      this.cutLine});

  Rows.fromJson(Map<String, dynamic> json) {
    points = json['points'];
    position = json['position'];
    played = json['played'];
    won = json['won'];
    drawn = json['drawn'];
    lost = json['lost'];
    goalsFor = json['goalsFor'];
    goalsAgainst = json['goalsAgainst'];
    positionChange = json['positionChange'];
    goalDifference = json['goalDifference'];
    recentForm = json['recentForm'].cast<String>();
    crestUrl = json['crestUrl'];
    clubId = json['clubId'];
    clubName = json['clubName'];
    clubShortName = json['clubShortName'];
    featuredTeam = json['featuredTeam'];
    cutLine = json['cutLine'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['points'] = points;
    data['position'] = position;
    data['played'] = played;
    data['won'] = won;
    data['drawn'] = drawn;
    data['lost'] = lost;
    data['goalsFor'] = goalsFor;
    data['goalsAgainst'] = goalsAgainst;
    data['positionChange'] = positionChange;
    data['goalDifference'] = goalDifference;
    data['recentForm'] = recentForm;
    data['crestUrl'] = crestUrl;
    data['clubId'] = clubId;
    data['clubName'] = clubName;
    data['clubShortName'] = clubShortName;
    data['featuredTeam'] = featuredTeam;
    data['cutLine'] = cutLine;
    return data;
  }
}
