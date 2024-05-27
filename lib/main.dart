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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: const Text(
              "This is where the question will go",
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
