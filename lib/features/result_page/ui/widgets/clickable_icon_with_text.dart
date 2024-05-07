import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClickableIconWithText extends StatelessWidget {
  final String text;
  final Color backGroudcolor;
  final IconData iconData;
  final void Function()? onTap;
  const ClickableIconWithText({
    super.key,
    required this.text,
    required this.backGroudcolor,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: CircleAvatar(
            backgroundColor: backGroudcolor,
            radius: 35.r,
            child: Center(
              child: Icon(
                iconData,
                size: 35.w,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),
        ),
      ],
    );
  }
}
