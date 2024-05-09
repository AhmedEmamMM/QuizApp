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
  Timer? timer;
  Timer? timerOf2Sec;
  int? selectedIndex;
  int questionNumber = 0;
  int timerSeconds = 5;
  int result = 0;
  int twoSecondTimer = 2;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (timerSeconds != 0) {
        setState(() {
          timerSeconds--;
        });
      } else {
        timer.cancel();
        startTwoSecondTimer();
        setState(() {
          selectedIndex = allQuestions[questionNumber].correctIndex;
        });
        await Future.delayed(const Duration(milliseconds: 2800));
        goToNextQuestion();
      }
    });
  }

  void startTwoSecondTimer() {
    timerOf2Sec = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (twoSecondTimer != 0) {
        setState(() {
          twoSecondTimer--;
        });
      } else {
        timerOf2Sec!.cancel();
      }
    });
  }

  void goToNextQuestion() {
    if (selectedIndex != null) timerOf2Sec!.cancel();
    if (questionNumber < allQuestions.length - 1) {
      setState(() {
        questionNumber++;
        timerSeconds = 5;
        twoSecondTimer = 2;
        selectedIndex = null;
      });
      startTimer();
    } else {
      timer!.cancel();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            result: result,
            numberOfQuestions: allQuestions.length,
          ),
        ),
      );
    }
  }

  void choosedAnswer(int index) async {
    selectedIndex = index;
    timer!.cancel();
    startTwoSecondTimer();
    setState(() {});
    final question = allQuestions[questionNumber];
    if (selectedIndex == question.correctIndex) result++;
    await Future.delayed(
        const Duration(milliseconds: 2800), () => goToNextQuestion());
  }

  String textOfBTN() {
    if (questionNumber < (allQuestions.length - 1)) {
      return 'Next';
    } else {
      return 'Finish';
    }
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuizCubit>(context).fetchQuetions();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
    timerOf2Sec!.cancel();
  }

  @override
  Widget build(BuildContext context) {
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
                                        Text((questionNumber + 1).toString(),
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
                                      "Question ${questionNumber + 1}/${allQuestions.length}",
                                      style: const TextStyle(
                                          color: Colors.deepPurple,
                                          fontSize: 16)),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 10),
                                    child: allQuestions.isEmpty
                                        ? const Text('No Questions')
                                        : Text(
                                            allQuestions[questionNumber]
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
                                  timerSeconds.toString(),
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
                            : allQuestions[questionNumber].answers.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: selectedIndex == null
                              ? () => choosedAnswer(index)
                              : null,
                          child: Options(
                            option: allQuestions.isEmpty
                                ? 'No Answer to show'
                                : allQuestions[questionNumber].answers[index],
                            correctIndex:
                                allQuestions[questionNumber].correctIndex,
                            choosedAnswerIndex: selectedIndex,
                            currentIndex: index,
                            isSelected: selectedIndex == index,
                          ),
                        ),
                      ),
                    ),
                    MyButton(
                      backGroudcolor: Colors.deepPurple,
                      text: (selectedIndex == null)
                          ? textOfBTN()
                          : '$twoSecondTimer',
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                      onPressed: selectedIndex == null
                          ? () {
                              timer!.cancel();
                              goToNextQuestion();
                            }
                          : () {},
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
