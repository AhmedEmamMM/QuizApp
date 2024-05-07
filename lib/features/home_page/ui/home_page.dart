import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/helpers/helpers.dart';
import 'package:quizz_app/core/widgets/my_buttons.dart';
import 'package:quizz_app/features/quiz_page/logic/quiz_cubit.dart';

import '../../quiz_page/ui/quiz_page.dart';

class HomaPage extends StatelessWidget {
  const HomaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            150.verticalSpace,
            const Text(
              'Welcome \n to my Quizy App',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            150.verticalSpace,
            MyButton(
              backGroudcolor: Colors.deepPurple,
              text: 'Start the Quiz',
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => QuizCubit(),
                      child: const QuizPage(),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
