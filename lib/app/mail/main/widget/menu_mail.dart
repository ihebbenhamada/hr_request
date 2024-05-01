import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/custom-button/custom-button.dart';

class MenuMail extends StatelessWidget {
  const MenuMail({
    super.key,
    required this.onClickSelectAll,
    required this.onClickDeselectAll,
    required this.onClickInverse,
    required this.onClickDelete,
    required this.onClickReplay,
  });
  final void Function() onClickSelectAll;
  final void Function() onClickDeselectAll;
  final void Function() onClickInverse;
  final void Function() onClickDelete;
  final void Function() onClickReplay;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(30),
        topLeft: Radius.circular(30),
      ),
      child: Container(
        width: double.infinity,
        height: 364.h,
        padding: EdgeInsets.only(
          left: 25,
          right: 25,
          top: 30.h,
        ),
        color: AppColors.gray2,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Choose Transition',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.primary,
                    ),
                  ),
                  20.h.verticalSpace,
                  GestureDetector(
                    onTap: onClickSelectAll,
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.selectAll,
                          height: 9.h,
                        ),
                        10.horizontalSpace,
                        Text(
                          'Select All',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: AppColors.blueDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  13.h.verticalSpace,
                  GestureDetector(
                    onTap: onClickDeselectAll,
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.deselect,
                          height: 11.h,
                        ),
                        10.horizontalSpace,
                        Text(
                          'Deselect Mails',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: AppColors.blueDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  13.h.verticalSpace,
                  GestureDetector(
                    onTap: onClickInverse,
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.inverseMail,
                          height: 12.h,
                        ),
                        10.horizontalSpace,
                        Text(
                          'Inverse select Mails',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: AppColors.blueDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  13.h.verticalSpace,
                  GestureDetector(
                    onTap: onClickDelete,
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.trash,
                          height: 18.h,
                        ),
                        10.horizontalSpace,
                        Text(
                          'Delete selecting Mail',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: AppColors.blueDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  13.h.verticalSpace,
                  GestureDetector(
                    onTap: onClickReplay,
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.replayDark,
                          height: 16.h,
                        ),
                        10.horizontalSpace,
                        Text(
                          'Replay Mail',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: AppColors.blueDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                text: 'Back',
                height: 50.h,
                onClick: () {
                  Get.back();
                },
              ),
            ),
            30.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
