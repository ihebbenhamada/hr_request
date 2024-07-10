import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
              padding: EdgeInsets.only(
                left: Get.locale?.languageCode == 'en' ? 12.0 : 0,
                right: Get.locale?.languageCode == 'ar' ? 12.0 : 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  7.h.verticalSpace,
                  Text(
                    title.tr,
                    style: TextStyle(
                      color: AppColors.blueDark,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    'amount'.tr,
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
          Positioned(
            left: Get.locale?.languageCode == 'ar' ? 0 : null,
            right: Get.locale?.languageCode == 'en' ? 0 : null,
            child: Image.asset(
              image,
              height: 66.h,
              matchTextDirection: true,
            ),
          ),
          Positioned(
            left: Get.locale?.languageCode == 'ar' ? 0 : null,
            right: Get.locale?.languageCode == 'en' ? 0 : null,
            child: Container(
              height: 27.h,
              width: 25,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.shape),
                  fit: BoxFit.fitHeight,
                  matchTextDirection: true,
                ),
              ),
              child: Center(
                child: Image.asset(
                  AppImages.more,
                  height: 11.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
