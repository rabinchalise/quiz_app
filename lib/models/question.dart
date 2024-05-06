class Question {
  Question({required this.question, required this.answer});
  final String question;
  final List<String> answer;

  List<String> get shuffledAnswers {
    final shuffleList = List.of(answer); // copy of orginal list
    shuffleList.shuffle(); // suffle doeston return anything but chnage the list
    return shuffleList;
  }
}
