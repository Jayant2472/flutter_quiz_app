import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function reset;

  Result(this.resultScore, this.reset);

  String get resultPhrase {
    var resultText;
    if (resultScore <= 8) {
      resultText = 'awsome1';
    } else if (resultScore <= 12) {
      resultText = 'awsome2';
    } else if (resultScore <= 16) {
      resultText = 'aswome3';
    } else {
      resultText = 'awsome4';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlatButton(
            child: Text(
              'Restart',
            ),
            onPressed: reset,
          ),
        ],
      ),
    );
  }
}
