import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'result_info_contanier.dart';
import 'your_score.dart';

class YourScoreAndResultInfoStack extends StatelessWidget {
  const YourScoreAndResultInfoStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 340.h,
          width: MediaQuery.of(context).size.width.w,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r),
            ),
          ),
          child: const YourScore(score: '100'),
        ),
        const Positioned(
          bottom: 60,
          left: 22,
          child: ResultInfoContanier(),
        ),
      ],
    );
  }
}
