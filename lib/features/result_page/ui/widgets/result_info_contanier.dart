import 'package:flutter/material.dart';

import 'row_of_result.dart';

class ResultInfoContanier extends StatelessWidget {
  const ResultInfoContanier({
    super.key,
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
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RowOfResult(
                leftColoredText: ' 100%',
                leftColor: Colors.deepPurple,
                leftBlackText: 'Complution',
                rightColoredText: ' 10',
                rightColor: Colors.deepPurple,
                rightBlackText: 'Total Questions',
              ),
              SizedBox(height: 25),
              RowOfResult(
                leftColoredText: ' 7',
                leftColor: Colors.green,
                leftBlackText: 'Correct',
                rightColoredText: ' 3',
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
