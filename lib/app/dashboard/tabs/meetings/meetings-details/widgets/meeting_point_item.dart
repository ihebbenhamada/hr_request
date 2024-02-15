import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:request_hr/config/colors/colors.dart';

class MeetingPointItem extends StatelessWidget {
  const MeetingPointItem({super.key, required this.name});

  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 11.h,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            blurRadius: 3,
            offset: Offset(0, 3),
            spreadRadius: 0,
          )
        ],
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 14.sp,
          color: AppColors.blueDark,
        ),
      ),
    );
  }
}
