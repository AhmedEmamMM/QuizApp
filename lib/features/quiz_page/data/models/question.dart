class Question {
   String? question;
   List<dynamic>? answers;
   String? correctAnswer;

  Question.fromJson(Map<String,dynamic> json){
    question = json['question'];
    answers = json['answers'];
    correctAnswer = json['correctAnswer'];
  }  
}
