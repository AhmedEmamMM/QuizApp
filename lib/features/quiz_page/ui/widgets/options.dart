// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Options extends StatelessWidget {
  final String option;
  final int? choosedAnswerIndex;
  final int correctIndex;
  final int currentIndex;
  final bool isSelected;
  const Options({
    super.key,
    required this.option,
    required this.choosedAnswerIndex,
    required this.correctIndex,
    required this.currentIndex,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    bool isCorrect = currentIndex == correctIndex;
    bool isWrong = !isCorrect && isSelected;
    return Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        child: choosedAnswerIndex != null
            ? Container(
                height: 42.h,
                decoration: BoxDecoration(
                  color: isCorrect
                      ? Colors.green
                      : isWrong
                          ? Colors.red
                          : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(width: 3, color: Colors.deepPurple),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          option,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Radio(
                          value: option,
                          groupValue: 2,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Container(
                height: 42.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(width: 3, color: Colors.deepPurple),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          option,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Radio(
                          value: option,
                          groupValue: 2,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  }
}
