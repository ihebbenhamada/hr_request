import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/colors/colors.dart';

class CustomDotsIndicator extends StatefulWidget {
  final Map<String, dynamic> carouselData;
  final RxInt current;

  const CustomDotsIndicator(
      {super.key, required this.carouselData, required this.current});

  @override
  _CustomDotsIndicatorState createState() => _CustomDotsIndicatorState();
}

class _CustomDotsIndicatorState extends State<CustomDotsIndicator> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget.carouselData.length,
          (index) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: 12.h,
              height: 12.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: widget.current.value == index
                    ? null
                    : Border.all(color: AppColors.gray3),
                color: widget.current.value == index
                    ? AppColors.primary
                    : AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
