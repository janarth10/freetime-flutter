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

class _FreeTimeState extends State<FreeTime> {
  @override
  Widget build(BuildContext context) {
    final activities_list = ['meditate', 'make coffee', 'quuick lap round Vic Park'];
    Random rnd = new Random();
    return Text(activities_list[rnd.nextInt(3)]);
  }
}