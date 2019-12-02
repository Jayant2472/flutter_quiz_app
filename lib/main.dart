import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/quiz.dart';
import 'package:flutter_quiz_app/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz () {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = const [
    {
      'questionText': 'What\'s my favorite color?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'white', 'score': 7},
        {'text': 'blue', 'score': 5},
        {'text': 'orange', 'score': 2}
      ],
    },
    {
      'questionText': 'What\'s my favorite animal?',
      'answers': [
        {'text': 'dog', 'score': 10},
        {'text': 'cat', 'score': 7},
        {'text': 'piggy', 'score': 5},
        {'text': 'duck', 'score': 2}
      ],
    },
    {
      'questionText': 'What\'s my favorite langauge?',
      'answers': [
        {'text': 'kotlin', 'score': 10},
        {'text': 'java', 'score': 7},
        {'text': 'dart', 'score': 3}
      ],
    },
    {
      'questionText': 'What\'s my favorite ide?',
      'answers': [
        {'text': 'VS Code', 'score': 10},
        {'text': 'Intellij', 'score': 5}
      ],
    },
  ];

  void _answerQuestion(int score) {

    _totalScore += score;

    print('Answer Chosen!');
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz App',
          ),
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
