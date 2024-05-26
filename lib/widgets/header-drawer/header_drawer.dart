import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({
    super.key,
    required this.closeDrawer,
    required this.image,
    required this.job,
    required this.name,
  });
  final void Function() closeDrawer;
  final String image;
  final String job;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 10.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AvatarCircle(
                image: image,
                size: 54.h,
                iconSize: 0,
                isBorderEnabled: false,
              ),
              6.horizontalSpace,
              Text(
                '$name,\n$job',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16.sp,
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: closeDrawer,
            child: Container(
              height: 38.h,
              width: 38.h,
              decoration: const ShapeDecoration(
                shape: OvalBorder(),
                color: AppColors.white,
              ),
              child: Center(
                child: Image.asset(
                  AppImages.back,
                  height: 21.h,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
