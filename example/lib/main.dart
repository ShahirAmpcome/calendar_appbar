import 'dart:math';

import 'package:cx_calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar AppBar Example App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? selectedDate;
  Random random = new Random();

  @override
  void initState() {
    setState(() {
      selectedDate = DateTime.now();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(
        width: MediaQuery.of(context).size.width,
        onDateChanged: (value) => setState(() => selectedDate = value),
        lastDate: DateTime.now().add(Duration(days: 30)),
        firstDate: DateTime.now().subtract(Duration(days: 30)),
        initialDate: DateTime.now(),
        backButton: false,
        weekOfYearLabel: "KW",
        events: List.generate(
          100,
          (index) => DateTime.now().add(Duration(days: 30)).subtract(Duration(days: index * random.nextInt(5))),
        ),
      ),
      body: Center(child: Text(selectedDate.toString())),
    );
  }
}
