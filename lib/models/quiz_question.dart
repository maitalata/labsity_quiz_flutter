class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    // final shuffledAnswers = List<String>.from(answers)..shuffle();
    // return shuffledAnswers;
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
