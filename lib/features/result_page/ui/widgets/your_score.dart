import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourScore extends StatelessWidget {
  final String score;
  const YourScore({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 85.r,
        backgroundColor: Colors.white.withOpacity(.3),
        child: Center(
          child: CircleAvatar(
            radius: 73.r,
            backgroundColor: Colors.white.withOpacity(.4),
            child: CircleAvatar(
              radius: 60.r,
              backgroundColor: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Your Score',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 20.sp,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          text: score,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                          children: const [
                            TextSpan(
                              text: ' pt',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
