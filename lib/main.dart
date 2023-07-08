// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_local_variable, avoid_print, must_be_immutable, unused_field

import 'package:flutter/material.dart';
//import 'package:flutter_complete_guide/result.dart';

import './quiz.dart';
import './result.dart';

//void main() {
//  runApp(MyApp());
//}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'Text': 'Black', 'score': 12},
        {'Text': 'Red', 'score': 9},
        {'Text': 'Green', 'score': 5},
        {'Text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favourote animal?',
      'answers': [
        {'Text': 'Cat', 'score': 4},
        {'Text': 'Dog', 'score': 10},
        {'Text': 'Rabbit', 'score': 7},
        {'Text': 'Lion', 'score': 1},
      ],
    },
    {
      'questionText': 'Who\'s your favourote instructor?',
      'answers': [
        {'Text': 'Max', 'score': 5},
        {'Text': 'Sam', 'score': 10},
        {'Text': 'Mark', 'score': 8},
        {'Text': 'Jeff', 'score': 2},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    //aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have no more questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ('hello');
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    //questions = []; // this does not work if questions is a const, questions has to be a variable for it to work

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
