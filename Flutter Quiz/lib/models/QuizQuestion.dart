class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shffuledlist = List.of(answers);
    shffuledlist.shuffle();
    return shffuledlist;
  }
}
