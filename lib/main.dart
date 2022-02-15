// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:quizzler_trainig/quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(Quizler());
}

QuizBrain quizBrain = QuizBrain();

// ignore: use_key_in_widget_constructors
class Quizler extends StatefulWidget {
  @override
  State<Quizler> createState() => _QuizlerState();
}

class _QuizlerState extends State<Quizler> {
  List<Icon> scoreKeeper = [];
  void checkAnswer(bool checkUserAnswers) {
    bool correctAnswer = quizBrain.getAnswer()!;

    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    if (quizBrain.isFinished()) {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('AlertDialog Title'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('This is a demo alert dialog.'),
                  Text('Would you like to approve of this message?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

      setState(() {
        quizBrain.reset();
        scoreKeeper.clear();
      });
    } else {
      setState(() {
        if (correctAnswer == true) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }

        quizBrain.nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 400,
                  height: 200,
                  child: Text(
                    quizBrain.getquesText()!,
                    // ignore: prefer_const_constructorsa
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  child: Text(
                    "true",
                    style: TextStyle(fontSize: 25),
                  ),
                  onPressed: () {
                    checkAnswer(true);
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.green, primary: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      checkAnswer(false);
                    },
                    child: Text("false", style: TextStyle(fontSize: 25)),
                    style: TextButton.styleFrom(backgroundColor: Colors.red, primary: Colors.white),
                  ),
                ),
              ),
              Row(
                children: scoreKeeper,
              )
            ],
          ),
        )),
      ),
    );
  }
}
