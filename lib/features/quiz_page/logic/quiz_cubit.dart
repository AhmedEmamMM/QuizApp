// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/models/question.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  int currentQuestion = 0;
  int questionNumber = 1;
  int correctAnswer = 0;
  int wrongAnswer = 0;
  int timerSeconds = 5;
  String timerSecondsAsString = '5';
  Color backGroudcolor = Colors.white;

  void fetchQuetions() async {
    emit(QuizLoading());
    await rootBundle
        .loadString("assets/json/question.json")
        .then((questions) async {
      final data = await json.decode(questions);
      debugPrint('data: $data');
      List<dynamic> questionss = data['questions'];
      debugPrint('questions: $questionss');
      List<Question> allQuestions =
          questionss.map((question) => Question.fromJson(question)).toList();
      debugPrint('allQuestions: $allQuestions');
      emit(QuizSuccess(allQuestions));
    });
  }
}
