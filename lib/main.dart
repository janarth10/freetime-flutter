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

String freeTimeChoice = activitiesList[0];
String randomFontFamily = fontFamilies[0];

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class _FreeTimeState extends State<FreeTime> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          freeTimeChoice,
          style: TextStyle(
            color: hexToColor("#f2a03d"), 
            fontSize: 45.0,
            fontFamily: randomFontFamily
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