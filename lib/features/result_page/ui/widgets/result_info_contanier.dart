import 'package:flutter/material.dart';

import 'row_of_result.dart';

class ResultInfoContanier extends StatelessWidget {
  final int result;
  final int numberOfQuestions;
  const ResultInfoContanier({
    super.key,
    required this.result,
    required this.numberOfQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 3,
            color: Colors.deepPurple.withOpacity(.7),
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RowOfResult(
                leftColoredText:
                    ' ${((result / numberOfQuestions) * 100).toStringAsFixed(0)} %',
                leftColor: Colors.deepPurple,
                leftBlackText: 'Complution',
                rightColoredText: ' $numberOfQuestions',
                rightColor: Colors.deepPurple,
                rightBlackText: 'Total Questions',
              ),
              const SizedBox(height: 25),
              RowOfResult(
                leftColoredText: ' $result',
                leftColor: Colors.green,
                leftBlackText: 'Correct',
                rightColoredText: ' ${numberOfQuestions - result}',
                rightColor: Colors.red,
                rightBlackText: 'Wrong',
                isPadding: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
