// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: Center(
          child: FreeTime(),
        ),
      ),
    );
  }
}


class FreeTime extends StatefulWidget {
  @override
  _FreeTimeState createState() => _FreeTimeState();
}

final activitiesList = [
  'Meditate', 
  'Make Coffee', 
  'Quuick Lap Round Vic Park',
  'Pulse Breath Work',
  'Stomach Massage Breath Work',
  'Box Breath Work',
];
final fontFamilies = [
  'CabinSketch',
  'Playball',
  'CinzelDecorative',
  'LobsterTwo',
  'Monoton',
  'MountainsofChristmas',
  'PressStart2p',
  'YeonSung',
  'ZCOOLKuaiLe',
];

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class SpareTimeActivity {
  const SpareTimeActivity({
    @required this.name,
    @required this.fontFamily,
    this.colorCode = "#f2a03d",
    // @required this.iconName,
  });

  final String name;
  final String fontFamily;
  final String colorCode;
  // final String iconName;

}

// TODO: Won't need this until I implement the scrollable list view
// List<SpareTimeActivity> getActivities() => activitiesList.map((x) => SpareTimeActivity(name: x)).toList();

class SpareTimeCard extends StatelessWidget {
  const SpareTimeCard({@required this.activity});
  
  final SpareTimeActivity activity;

  Widget build(BuildContext context){
    return Padding(padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 300,
        width: 400,
        child: Card(
          elevation: 8,
          shadowColor: hexToColor(activity.colorCode),
          child: Padding(
            padding: const EdgeInsets.all(20), 
            child: Text(
              activity.name,
              style: TextStyle(
                color: hexToColor(activity.colorCode), 
                fontSize: 45.0,
                fontFamily: activity.fontFamily
              )
            )
          )
        )
      )
    );
  }
}

class _FreeTimeState extends State<FreeTime> {
  String freeTimeChoice = activitiesList[0];
  String randomFontFamily = fontFamilies[0];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SpareTimeCard(
          activity: SpareTimeActivity(
              name: freeTimeChoice,
              fontFamily: randomFontFamily,
            )
        ),
        Padding(padding: EdgeInsets.only(top: 100.0)),
        IconButton(
          icon: const Icon(Icons.offline_bolt_rounded),
          iconSize: 100,
          tooltip: "Freetime Flutter Lottery!",
          onPressed: () {
            setState(() {
              Random rnd = new Random();

              freeTimeChoice = activitiesList[rnd.nextInt(activitiesList.length)];
              randomFontFamily = fontFamilies[rnd.nextInt(fontFamilies.length)];

              print(freeTimeChoice);
              print(randomFontFamily);
            });
          },
        ),
      ],
    );
  }
}