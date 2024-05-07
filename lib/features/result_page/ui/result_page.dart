import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/pdf_home_leader_board_row.dart';
import 'widgets/play_again_rwview_share_row.dart';
import 'widgets/your_score_and_result_info_stack.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 521.h,
            width: MediaQuery.of(context).size.width.w,
            child: const YourScoreAndResultInfoStack(),
          ),
          const PlayAgainReviewShareRow(),
          20.h.verticalSpace,
          const PdfHomeLaeaderBoardRow(),
        ],
      ),
    );
  }
}
