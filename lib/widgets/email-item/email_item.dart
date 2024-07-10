import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';

class EmailItem extends StatelessWidget {
  const EmailItem({
    super.key,
    required this.isSelected,
    required this.image,
    required this.subject,
    required this.sender,
    required this.description,
    required this.date,
    required this.onClickItem,
    required this.onSelectMail,
  });
  final bool isSelected;
  final String image;
  final String subject;
  final String sender;
  final String description;
  final String date;
  final void Function() onClickItem;
  final void Function() onSelectMail;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onSelectMail,
          child: Container(
            height: 23.h,
            width: 23.h,
            decoration: ShapeDecoration(
              shape: const OvalBorder(
                side: BorderSide(
                  color: AppColors.primary,
                  width: 2.5,
                ),
              ),
              color: isSelected ? AppColors.primary : AppColors.white,
            ),
            child: Center(
              child: Icon(
                Icons.check,
                color: AppColors.white,
                size: 17.h,
              ),
            ),
          ),
        ),
        7.horizontalSpace,
        Expanded(
          child: GestureDetector(
            onTap: onClickItem,
            child: Container(
              clipBehavior: Clip.none,
              padding: EdgeInsets.all(12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: AppColors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x29000000),
                    blurRadius: 3,
                    offset: Offset(0, 3),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 39.h,
                    width: 39.h,
                    decoration: const ShapeDecoration(
                      shape: OvalBorder(
                        side: BorderSide(color: AppColors.gray3),
                      ),
                    ),
                    child: AvatarCircle(
                      image: image,
                      size: 39.h,
                      iconSize: 0,
                      isNetworkImage: true,
                    ),
                  ),
                  5.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subject,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.primary,
                          ),
                        ),
                        Text(
                          sender,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.blueDark,
                          ),
                        ),
                        4.h.verticalSpace,
                        Text(
                          description,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.blueDark,
                          ),
                        ),
                        4.h.verticalSpace,
                        Padding(
                          padding: EdgeInsets.only(
                            right: Get.locale?.languageCode == 'en' ? 12.0 : 0,
                            left: Get.locale?.languageCode == 'ar' ? 12.0 : 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                date,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.blueDark,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 20.h,
                                    width: 20.h,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          AppImages.forwardMailContainer,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        AppImages.attachEmail,
                                        height: 10.h,
                                      ),
                                    ),
                                  ),
                                  7.horizontalSpace,
                                  Container(
                                    height: 20.h,
                                    width: 20.h,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          AppImages.forwardMailContainer,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        AppImages.forwardEmail,
                                        height: 8.h,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
