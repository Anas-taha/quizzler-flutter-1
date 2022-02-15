// ignore_for_file: unnecessary_string_escapes, file_names

import 'package:quizzler_trainig/quistion.dart';

int quistionNumber = 0;

class QuizBrain {
  List<Question> quistionBank = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of  human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question('No piece of square dry paper can be folded in half more than 7 times.', false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
  ];

  void nextQuestion() {
    reset();
    if (quistionNumber < quistionBank.length - 1) {
      quistionNumber++;
    }
  }

  void reset() {
    if (quistionNumber == quistionBank.length - 1) {
      quistionNumber = 0;
    }
  }

  String? getquesText() {
    return quistionBank[quistionNumber].quistionText;
  }

  bool? getAnswer() {
    return quistionBank[quistionNumber].questionAnswer;
  }

  bool isFinished() {
    if (quistionNumber == quistionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }
}
