import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/helpers/helpers.dart';
import 'package:quizz_app/features/quiz_page/ui/quiz_page.dart';

import '../../../quiz_page/logic/quiz_cubit.dart';
import 'clickable_icon_with_text.dart';

class PlayAgainReviewShareRow extends StatelessWidget {
  const PlayAgainReviewShareRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClickableIconWithText(
            text: 'Play Again',
            backGroudcolor: Colors.deepPurple,
            iconData: Icons.refresh,
            onTap: () => context.navigatoAndRemoveAll(
              BlocProvider(
                create: (context) => QuizCubit(),
                child: const QuizPage(),
              ),
            ),
          ),
          ClickableIconWithText(
            text: 'Review Answer',
            backGroudcolor: Colors.cyan,
            iconData: Icons.remove_red_eye,
            onTap: () {},
          ),
          ClickableIconWithText(
            text: 'Share Score',
            backGroudcolor: Colors.green,
            iconData: Icons.share,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
