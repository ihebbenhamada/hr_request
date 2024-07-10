import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

import '../../config/colors/colors.dart';

class CarouselSliderMeetingsItem extends StatelessWidget {
  const CarouselSliderMeetingsItem({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.date,
  });
  final String title;
  final String image;
  final String description;
  final String date;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        alignment: Alignment.centerRight,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 247.w,
            height: 97.h,
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
                  left: Get.locale?.languageCode == 'en' ? 10.0 : 0,
                  right: Get.locale?.languageCode == 'ar' ? 10.0 : 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    height: 60,
                  ),
                  9.horizontalSpace,
                  SizedBox(
                    width: 140.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        12.h.verticalSpace,
                        Text(
                          title.tr,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 14.sp,
                          ),
                        ),
                        8.h.verticalSpace,
                        Flexible(
                          child: Text(
                            description.tr.toString(),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            maxLines: 3,
                            style: TextStyle(
                              color: AppColors.blueDark,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: Get.locale?.languageCode == 'en' ? -16.5.h : null,
            left: Get.locale?.languageCode == 'ar' ? -16.5.h : null,
            child: Container(
              height: 33.h,
              width: 33.h,
              decoration: const ShapeDecoration(
                color: AppColors.white,
                shape: OvalBorder(
                  side: BorderSide(
                    width: 3,
                    color: AppColors.gray2,
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x29000000),
                    blurRadius: 3,
                    offset: Offset(0, 3),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Center(
                child: Image.asset(
                  AppImages.morePrimary,
                  height: 12.h,
                ),
              ),
            ),
          ),
          Positioned(
            right: Get.locale?.languageCode == 'en' ? 22 : null,
            left: Get.locale?.languageCode == 'ar' ? 22 : null,
            bottom: 0.h,
            child: Container(
              height: 20.h,
              padding: const EdgeInsets.symmetric(horizontal: 11),
              decoration: ShapeDecoration(
                color: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
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
              child: Center(
                child: Text(
                  date,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
