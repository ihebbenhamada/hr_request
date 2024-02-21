import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

import '../../config/colors/colors.dart';

class CarouselSliderBonusPunishmentsItem extends StatelessWidget {
  const CarouselSliderBonusPunishmentsItem({
    super.key,
    required this.title,
    required this.amount,
    required this.image,
    required this.type,
  });
  final String title;
  final double amount;
  final String image;
  final int type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: 120.w,
            height: 146.h,
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
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  7.h.verticalSpace,
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.blueDark,
                      fontSize: 14.sp,
                    ),
                  ),
                  9.h.verticalSpace,
                  Text(
                    amount.toString(),
                    style: TextStyle(
                      color: type == 0 ? AppColors.primary : AppColors.redLight,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            image,
            height: 66.h,
          ),
          Container(
            height: 27.h,
            width: 25,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.shape),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Center(
              child: Image.asset(
                AppImages.more,
                height: 11.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
