// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'dart:math';
// import 'package:drawing_animation/drawing_animation.dart';
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

class _FreeTimeState extends State<FreeTime> {
  String freeTimeChoice = activitiesList[0];

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 400,
          child: ListView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: activitiesList.length,
            itemBuilder: (BuildContext context, int index) {
              return SpareTimeCard(
                activity: SpareTimeActivity(
                    name: activitiesList[index],
                    fontFamily: 'CabinSketch',
                  )
              );
            }
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
              int randInt = rnd.nextInt(activitiesList.length);

              double scrollToOffset = calculateWidgetScrollOffset(randInt, controller.position.maxScrollExtent);
              controller.animateTo(scrollToOffset, duration: Duration(seconds: 1), curve: Curves.easeIn);
            });
          },
        ),
      ],
    );
  }
}

// 
//  Helper Classes
// 

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
            // child: Text(
            //   activity.name,
            //   style: TextStyle(
            //     color: hexToColor(activity.colorCode), 
            //     fontSize: 45.0,
            //     fontFamily: activity.fontFamily
            //   )
            // )
            child: AnimatedDrawing.svg(
              "assets/my_drawing.svg",
              // run: this.run,
              duration: new Duration(seconds: 3),
              // onFinish: () => setState(() {
              //   this.run  = false;
              // }),
            )
          )
        )
      )
    );
  }
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

// 
//  Helper Functions
// 

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

double calculateWidgetScrollOffset(int widgetIndex, double maxScrollOffset){
  return widgetIndex * maxScrollOffset / (activitiesList.length - 1);
}

// 
//  Constants 
// 

final activitiesList = [
  // Zen
  'Clear Mind Meditation',
  'Day Dream Meditation' 
  'Pulse Breath Work',
  'Stomach Massage Breath Work',
  'Box Breath Work',
  // Mind
  'Read, oh wise one',
  'Audible at home',
  'Brilliant.org',
  'Brain dump writing',
  'Write a post',
  // The Great Outdoors
  "Speedy lap round Vic' park",
  "Coffee/Snack Drive",
  // Chore or Challenge
  'Vaccuum room and living room',
  'Laundry',
  'Cold shower',
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
