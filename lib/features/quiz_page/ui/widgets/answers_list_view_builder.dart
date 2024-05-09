import 'package:flutter/material.dart';

import 'options.dart';

class AnswersListViewBuilder extends StatelessWidget {
  final int noOfAnswers;
  final int? selectedIndex;
  final void Function()? onTap;
  final bool isEmpty;
  final String answers;
  final int correctIndex;
  const AnswersListViewBuilder({
    super.key,
    required this.noOfAnswers,
    required this.selectedIndex,
    required this.onTap,
    required this.isEmpty,
    required this.answers,
    required this.correctIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: noOfAnswers,
      itemBuilder: (context, index) => GestureDetector(
        onTap: selectedIndex == null ? onTap : null,
        child: Options(
          option: isEmpty ? 'No Answer to show' : answers,
          correctIndex: correctIndex,
          choosedAnswerIndex: selectedIndex,
          currentIndex: index,
          isSelected: selectedIndex == index,
        ),
      ),
    );
  }
}
