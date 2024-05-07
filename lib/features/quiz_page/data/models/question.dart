class Question {
  String? question;
  List<dynamic>? answers;
  int? correctIndex;

  Question.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answers = json['answers'];
    correctIndex = json['correctIndex'];
  }
}
