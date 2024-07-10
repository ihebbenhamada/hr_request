import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.onClickProfile,
    required this.onClickMessage,
    required this.onClickNotification,
    required this.onClickMenu,
    required this.image,
    required this.name,
    required this.job,
  });
  final void Function() onClickProfile;
  final void Function() onClickMessage;
  final void Function() onClickNotification;
  final void Function() onClickMenu;
  final String image;
  final String name;
  final String job;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top,
        left: 25,
        right: 25,
        bottom: 17.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onClickProfile,
            child: Row(
              children: [
                AvatarCircle(
                  image: image,
                  size: 45.h,
                  iconSize: 0,
                  stroke: true,
                  isBorderEnabled: false,
                ),
                6.horizontalSpace,
                Text(
                  '$name${Get.locale?.languageCode == 'ar' ? '،' : ','}\n$job',
                  style: TextStyle(
                    color: AppColors.blueDark,
                    fontSize: 12.sp,
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: onClickMessage,
                child: Image.asset(
                  AppImages.message,
                  matchTextDirection: true,
                  height: 23.h,
                ),
              ),
              12.horizontalSpace,
              GestureDetector(
                onTap: onClickNotification,
                child: Image.asset(
                  AppImages.notification,
                  height: 23.h,
                ),
              ),
              12.horizontalSpace,
              GestureDetector(
                onTap: onClickMenu,
                child: Image.asset(
                  AppImages.menu,
                  matchTextDirection: true,
                  height: 20.h,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
