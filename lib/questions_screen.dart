import 'package:flutter/material.dart';
import 'package:labsity_tech/answer_button.dart';
import 'package:labsity_tech/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
      print('Answered question $currentQuestionIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.ubuntu(
                fontSize: 20,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion
                .getShuffledAnswers()
                .map((answer) => AnswerButton(
                      answerText: answer,
                      clickHandler: () => answerQuestion(answer),
                    )),
            // AnswerButton(
            //     answerText: currentQuestion.answers[0], clickHandler: () {}),
            // AnswerButton(
            //     answerText: currentQuestion.answers[1], clickHandler: () {}),
            // AnswerButton(
            //     answerText: currentQuestion.answers[2], clickHandler: () {}),
            // AnswerButton(
            //     answerText: currentQuestion.answers[3], clickHandler: () {}),
          ],
        ),
      ),
    );
  }
}
