import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/colors/colors.dart';

class CarouselInfoItem extends StatelessWidget {
  const CarouselInfoItem({
    super.key,
    required this.title,
    required this.image,
    required this.value,
  });

  final String title;
  final String image;
  final int value;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: (MediaQuery.of(context).size.width / 3) - 15,
        padding: EdgeInsets.only(
          top: 17.h,
        ),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x29000000),
              blurRadius: 3,
              offset: Offset(0, 3),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 57.h,
              height: 57.h,
              decoration: const ShapeDecoration(
                color: AppColors.gray2,
                shape: OvalBorder(),
              ),
              child: Center(
                child: Image.asset(
                  image,
                  height: 26.h,
                ),
              ),
            ),
            9.h.verticalSpace,
            Text(
              title.tr,
              style: TextStyle(
                color: AppColors.blueDark,
                fontSize: 16.sp,
              ),
            ),
            4.h.verticalSpace,
            Text(
              value.toString(),
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
