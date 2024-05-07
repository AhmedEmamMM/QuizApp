import 'package:flutter/material.dart';
import 'package:quizz_app/features/result_page/ui/widgets/colum_in_row_of_result.dart';

class RowOfResult extends StatelessWidget {
  final String leftColoredText;
  final Color leftColor;
  final String leftBlackText;
  final String rightColoredText;
  final Color rightColor;
  final String rightBlackText;
  final bool isPadding;
  const RowOfResult({
    super.key,
    required this.leftColoredText,
    required this.leftColor,
    required this.leftBlackText,
    required this.rightColoredText,
    required this.rightColor,
    required this.rightBlackText,
    this.isPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ColumnInRowOFRestult(
          coloredText: leftColoredText,
          color: leftColor,
          text: leftBlackText,
        ),
        Padding(
          padding:
              isPadding ? const EdgeInsets.only(right: 58.0) : EdgeInsets.zero,
          child: ColumnInRowOFRestult(
            coloredText: rightColoredText,
            color: rightColor,
            text: rightBlackText,
          ),
        ),
      ],
    );
  }
}
