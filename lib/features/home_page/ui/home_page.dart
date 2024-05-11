import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            70.verticalSpace,
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              child: Stack(children: [
                Center(
                    child:
                        Image.asset('assets/imgs/quiz_logo.png', height: 200)),
                Positioned(
                  bottom: 15,
                  right: 55,
                  child:
                      Image.asset('assets/imgs/question_mark.png', height: 100),
                ),
              ]),
            ),
            RichText(
              text: const TextSpan(
                text: "Welcome\n",
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: "to Quizy App",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )
                ],
              ),
            ),
            100.verticalSpace,
            MyButton(
              backGroudcolor: Colors.deepPurple,
              text: 'Start the Quiz',
              textStyle: TextStyle(
                color: hexColor('ffffff'),
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
