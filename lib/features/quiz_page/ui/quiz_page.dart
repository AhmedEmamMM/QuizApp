import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizz_app/core/widgets/my_buttons.dart';
import 'package:quizz_app/features/quiz_page/ui/widgets/options.dart';
import 'package:quizz_app/features/result_page/ui/result_page.dart';
import '../logic/quiz_cubit.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late List<dynamic> allQuestions;
  int timer = 5;
  int currentQuestion = 0;
  int questionNumber = 1;

  void startTimer() {
    Future.doWhile(
      () async {
        //this changes the value by -1 every second until it reaches zero
        await Future.delayed(const Duration(seconds: 1));
        if (timer != 0) {
          setState(() {
            //add text widget in your build method which takes t as the data
            timer--;
          });
          return true;
        } else if (currentQuestion < allQuestions.length - 1) {
          setState(() {
            currentQuestion++;
            questionNumber++;
            timer = 5;
          });
          return true;
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ResultPage()));
          return false;
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuizCubit>(context).fetchQuetions();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    var quizBloc = BlocProvider.of<QuizCubit>(context);

    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        if (state is QuizLoading) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.deepPurple));
        } else if (state is QuizSuccess) {
          allQuestions = state.allQuestions;
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 420,
                      width: 400,
                      child: Stack(
                        children: [
                          Container(
                            height: 270,
                            width: 390,
                            decoration: const BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                )),
                          ),
                          Positioned(
                            bottom: 60,
                            left: 22,
                            right: 22,
                            child: Container(
                              height: 200,
                              width: 350,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 5,
                                      spreadRadius: 3,
                                      color: Colors.deepPurple.withOpacity(.4)),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 15, top: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text((questionNumber).toString(),
                                            style: const TextStyle(
                                                color: Colors.orange,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold)),
                                        Text(allQuestions.length.toString(),
                                            style: const TextStyle(
                                                color: Colors.green,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  Text(
                                      "Question $questionNumber/${allQuestions.length}",
                                      style: const TextStyle(
                                          color: Colors.deepPurple,
                                          fontSize: 16)),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 10),
                                    child: allQuestions.isEmpty
                                        ? const Text('No Questions')
                                        : Text(
                                            allQuestions[currentQuestion]
                                                .question,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 245.h,
                            left: 142.w,
                            child: Center(
                              child: CircleAvatar(
                                radius: 42.r,
                                backgroundColor: Colors.white,
                                child: Text(
                                  timer.toString(),
                                  style: const TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: allQuestions.isEmpty
                            ? 1
                            : allQuestions[currentQuestion].answers.length,
                        itemBuilder: (context, index) => Options(
                          option: allQuestions.isEmpty
                              ? 'No Answer to show'
                              : allQuestions[currentQuestion].answers[index],
                          correctAnswer: allQuestions.isEmpty
                              ? 'There is no asnwer'
                              : allQuestions[currentQuestion].correctAnswer,
                        ),
                      ),
                    ),
                    MyButton(
                      backGroudcolor: Colors.deepPurple,
                      text: 'Next',
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                      onPressed: () {},
                    ),
                    30.verticalSpace,
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Text('Something went Wrong');
        }
      },
    );
  }
}
