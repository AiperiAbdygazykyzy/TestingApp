import 'package:flutter/material.dart';
import 'package:sabak6_tirkeme5/testing_page.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Testing',
      home: TestingPage(),
    );
  }
}
