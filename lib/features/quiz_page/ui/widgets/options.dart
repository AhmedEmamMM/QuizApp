import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Options extends StatefulWidget {
  final String option;
  final String correctAnswer;
  const Options({
    super.key,
    required this.option,
    required this.correctAnswer,
  });

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  Color bgColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (widget.option == widget.correctAnswer) {
              setState(() {
                bgColor = Colors.green;
              });
            } else {
              setState(() {
                bgColor = Colors.red;
              });
            }
          },
          child: Container(
            height: 42.h,
            decoration: BoxDecoration(
              color: bgColor,
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
                      widget.option,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Radio(
                      value: widget.option,
                      groupValue: 2,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
