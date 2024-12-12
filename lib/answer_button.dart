import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  // AnswerButton(this.answerText, this.clickHandler {super.key}); // This is the original line using positional parameters
  const AnswerButton(
      {super.key,
      required this.answerText,
      required this.clickHandler}); // This is the updated line using named parameters

  final String answerText;
  final void Function() clickHandler;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: clickHandler,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 1,
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
