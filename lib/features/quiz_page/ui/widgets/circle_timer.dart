import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleTimer extends StatelessWidget {
  final int timerSeconds;
  const CircleTimer({super.key, required this.timerSeconds});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 245.h,
      left: 142.w,
      child: Center(
        child: CircleAvatar(
          radius: 42.r,
          backgroundColor: Colors.white,
          child: Text(
            timerSeconds.toString(),
            style: const TextStyle(
              color: Colors.deepPurple,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
