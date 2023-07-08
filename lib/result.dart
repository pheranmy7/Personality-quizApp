// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, sort_child_properties_last

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText;
    if (resultScore <= 10) {
      resultText = 'You are excellent and innocent';
    } else if (resultScore <= 15) {
      resultText = 'ehmm...you did well';
    } else if (resultScore <= 20) {
      resultText = 'Pretty strange';
    } else {
      resultText = 'You are so bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text('Restart the Quiz'),
            onPressed:
                resetHandler(), //im not supposed to put the parentheses sha

            style: TextButton.styleFrom(
              // ignore: deprecated_member_use
              primary: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
