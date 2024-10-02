// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:oop_tutorial/generals/reifen.dart';

class V16Auto {
  int insasseZahl;
  DateTime baujahr;
  List<Reifen> reifen;
  String? marke;
  V16Auto({
    required this.insasseZahl,
    required this.baujahr,
    required this.reifen,
    this.marke,
  });

  V16Auto copyWith({
    int? insasseZahl,
    DateTime? baujahr,
    List<Reifen>? reifen,
    String? marke,
  }) {
    return V16Auto(
      insasseZahl: insasseZahl ?? this.insasseZahl,
      baujahr: baujahr ?? this.baujahr,
      reifen: reifen ?? this.reifen,
      marke: marke ?? this.marke,
    );
  }

  factory V16Auto.defaultAuto() {
    return V16Auto(
      insasseZahl: 5,
      baujahr: DateTime(2020),
      reifen: [
        Reifen(
          position: 'front-left',
          radius: 30,
          breite: 20,
        ),
        Reifen(
          position: 'front-right',
          radius: 30,
          breite: 20,
        ),
        Reifen(
          position: 'rear-left',
          radius: 30,
          breite: 20,
        ),
        Reifen(
          position: 'rear-right',
          radius: 30,
          breite: 20,
        ),
      ],
      marke: 'Auto1',
    );
  }

  Map<String, dynamic> toMap() {
    final reifenMapList = <Map<String, dynamic>>[];
    for (var element in reifen) {
      reifenMapList.add(element.toMap());
    }
    return <String, dynamic>{
      'insasseZahl': insasseZahl,
      'baujahr': baujahr.millisecondsSinceEpoch,
      'reifen': reifenMapList,
      'marke': marke,
    };
  }

  factory V16Auto.fromMap(Map<String, dynamic> map) {
    final reifenList = <Reifen>[];
    for (var element in map['reifen'] as List) {
      reifenList.add(Reifen.fromMap(element as Map<String, dynamic>));
    }
    return V16Auto(
      insasseZahl: map['insasseZahl'] as int,
      baujahr: DateTime.fromMillisecondsSinceEpoch(map['baujahr'] as int),
      reifen: reifenList,
      marke: map['marke'] != null ? map['marke'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory V16Auto.fromJson(String source) => V16Auto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'V16Auto(insasseZahl: $insasseZahl, baujahr: $baujahr, reifen: $reifen, marke: $marke)';
  }
}

final v16AutoJsonElement = '''
                             {
                              "insasseZahl":5,
                              "baujahr":1577833200000,
                              "reifen":[
                                         {"position":"front-left","radius":30.0,"breite":20.0},
                                         {"position":"front-right","radius":30.0,"breite":20.0},
                                         {"position":"rear-left","radius":30.0,"breite":20.0},
                                         {"position":"rear-right","radius":30.0,"breite":20.0}
                                       ],
                              "marke":"Auto1"
                              }
                               ''';
                            

final v16AutoJsonFile = '''
[
  {
    "insasseZahl": 5,
    "baujahr": 1577833200000,
    "reifen": [
      {"position": "front-left", "radius": 30.0, "breite": 20.0},
      {"position": "front-right", "radius": 30.0, "breite": 20.0},
      {"position": "rear-left", "radius": 30.0, "breite": 20.0},
      {"position": "rear-right", "radius": 30.0, "breite": 20.0}
    ],
    "marke": "Auto1"
  },
  {
    "insasseZahl": 5,
    "baujahr": 1577833200000,
    "reifen": [
      {"position": "front-left", "radius": 30.0, "breite": 20.0},
      {"position": "front-right", "radius": 30.0, "breite": 20.0},
      {"position": "rear-left", "radius": 30.0, "breite": 20.0},
      {"position": "rear-right", "radius": 30.0, "breite": 20.0}
    ],
    "marke": "Auto2"
  },
  {
    "insasseZahl": 5,
    "baujahr": 1577833200000,
    "reifen": [
      {"position": "front-left", "radius": 30.0, "breite": 20.0},
      {"position": "front-right", "radius": 30.0, "breite": 20.0},
      {"position": "rear-left", "radius": 30.0, "breite": 20.0},
      {"position": "rear-right", "radius": 30.0, "breite": 20.0}
    ],
    "marke": "Auto3"
  }
]
''';
