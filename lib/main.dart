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
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
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

String freeTimeChoice = 'meditate';
final activitiesList = ['meditate', 'make coffee', 'quuick lap round Vic Park'];

class _FreeTimeState extends State<FreeTime> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(freeTimeChoice),
        IconButton(
          icon: const Icon(Icons.offline_bolt_rounded),
          iconSize: 100,
          tooltip: "Freetime Flutter Lottery!",
          onPressed: () {
            setState(() {
              Random rnd = new Random();
              freeTimeChoice = activitiesList[rnd.nextInt(3)];
            });
          },
        ),
      ],
    );
  }
}