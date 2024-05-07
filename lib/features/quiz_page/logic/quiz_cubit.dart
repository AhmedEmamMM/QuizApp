// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/models/question.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  void fetchQuetions() async {
    emit(QuizLoading());
    await rootBundle
        .loadString("assets/json/question.json")
        .then((jsonData) async {
      final data = await json.decode(jsonData);
      List<dynamic> questionss = data['questions'];
      List<Question> allQuestions =
          questionss.map((question) => Question.fromJson(question)).toList();
      emit(QuizSuccess(allQuestions));
    });
  }
}
