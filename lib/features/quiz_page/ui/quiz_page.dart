import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizz_app/core/widgets/my_buttons.dart';
import 'package:quizz_app/features/quiz_page/ui/widgets/options.dart';
import 'package:quizz_app/features/result_page/ui/result_page.dart';
import '../logic/quiz_cubit.dart';
import 'widgets/circle_timer.dart';
import 'widgets/question_cart_info.dart';
import 'widgets/top_purple_back_ground.dart';

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
  int timerSeconds = 30;
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
        timerSeconds = 30;
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
              body: Column(
                children: [
                  SizedBox(
                    height: 420,
                    width: 400,
                    child: Stack(
                      children: [
                        const TopPurpleBackGround(),
                        QuestionCardInfo(
                            questionNO: questionNumber,
                            noOfQuestions: allQuestions.length,
                            isEmpty: allQuestions.isEmpty,
                            question: allQuestions[questionNumber].question),
                        CircleTimer(timerSeconds: timerSeconds),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: ListView.builder(
                      shrinkWrap: true,
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
                  25.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: MyButton(
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
                  ),
                  30.verticalSpace,
                ],
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
