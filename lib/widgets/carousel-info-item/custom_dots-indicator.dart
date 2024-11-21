import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:request_hr/config/colors/colors.dart';

class CustomDotsIndicator extends StatefulWidget {
  const CustomDotsIndicator({
    super.key,
    required this.current,
    required this.length,
  });
  final int length;
  final int current;

  @override
  _CustomDotsIndicatorState createState() => _CustomDotsIndicatorState();
}

class _CustomDotsIndicatorState extends State<CustomDotsIndicator> {
  @override
  Widget build(BuildContext context) {
    log('length : => ' + widget.length.toString());
    log('current : => ' + widget.current.toString());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.length,
        (index) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            width: 12.h,
            height: 12.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: widget.current == index
                  ? null
                  : Border.all(color: AppColors.gray3),
              color:
                  widget.current == index ? AppColors.primary : AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
