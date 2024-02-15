import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/colors/colors.dart';

class CarouselSliderItem extends StatelessWidget {
  final List<Map<String, dynamic>> slideItems;

  const CarouselSliderItem({super.key, required this.slideItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Add your carousel slide content here, using slideItems
        for (var item in slideItems)
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 115.w,
              height: 142.h,
              padding: EdgeInsets.only(top: 17.h),
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
                        item['image'],
                        height: 26.h,
                      ),
                    ),
                  ),
                  9.h.verticalSpace,
                  Text(
                    item['title'],
                    style: TextStyle(
                      color: AppColors.blueDark,
                      fontSize: 16.sp,
                    ),
                  ),
                  4.h.verticalSpace,
                  Text(
                    item['value'].toString(),
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
