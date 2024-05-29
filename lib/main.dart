import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  List<String> questions = [
    'Is Magnus Carlsen Norwegian?',
    'is Tunis the capital of Morocco?',
    'is 2 times 2 equals 4 ?'
  ];
  List<bool> answers = [true, false, true];
  int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child:  Text(
              questions[questionNumber],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              
              setState(() {
                questionNumber += 1;
                
                scoreKeeper.add(
                  Icon(Icons.check, color: Colors.green),
                  
                );
                
              });
            },
            child: Text(
              'True',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.green,
              ),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              setState(() {
                questionNumber += 1;
                scoreKeeper.add(
                  Icon(Icons.close, color: Colors.red),
                );
              });
            },
            child: Text(
              'False',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.red,
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
