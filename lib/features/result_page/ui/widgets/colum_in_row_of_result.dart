import 'package:flutter/material.dart';

class ColumnInRowOFRestult extends StatelessWidget {
  final String coloredText;
  final String text;
  final Color color;
  const ColumnInRowOFRestult(
      {super.key,
      required this.coloredText,
      required this.text,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Row(
            children: [
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
              ),
              Text(
                coloredText,
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 20, color: color),
              ),
            ],
          ),
        ),
        Text(text),
      ],
    );
  }
}
