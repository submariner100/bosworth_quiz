import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 4},
        {'text': 'Green', 'score': 4},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 2},
        {'text': 'Snake', 'score': 3},
        {'text': 'Elephant', 'score': 6},
        {'text': 'Lion', 'score': 4}
      ],
    },
    {
      'questionText': 'Who\s your favourite instructor',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 2},
        {'text': 'Max', 'score': 3},
        {'text': 'Max', 'score': 4}
      ],
    },
    {
      'questionText': 'What is your favourite meal',
      'answers': [
        {'text': 'Burger', 'score': 2},
        {'text': 'Chips', 'score': 3},
        {'text': 'Pizza', 'score': 2},
        {'text': 'Pies', 'score': 4}
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
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '          Market Bosworth Village Quiz',
            style: TextStyle(fontSize: 24),
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
