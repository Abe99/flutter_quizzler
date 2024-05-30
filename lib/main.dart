import 'package:flutter/material.dart';
import 'question.dart';

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
  
  List <Question> questionBank = [
  Question(q:'Is Magnus Carlsen Norwegian?',a: true ),
  Question(q:'is Tunis the capital of Morocco?',a: false ),
  Question(q: 'is 2 times 2 equals 4 ?',a: true)];
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
              questionBank[questionNumber].questionText!,
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
              bool correctAnswer = questionBank[questionNumber].questionAnswer!;
              
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
              bool correctAnswer = questionBank[questionNumber].questionAnswer!;
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
