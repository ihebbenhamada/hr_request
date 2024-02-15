import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';
import 'package:request_hr/widgets/custom-button/custom-button.dart';

import '../../../../config/image_urls/image_urls.dart';
import '../controllers/create_mail_controller.dart';

class CreateMailScreen extends StatelessWidget {
  final _createMailController = Get.put(CreateMailController());

  CreateMailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 25.0,
          right: 25,
          top: MediaQuery.of(context).viewPadding.top + 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: AvatarCircle(
                image: AppImages.profile,
                circleColor: AppColors.white,
                size: 111.h,
                iconSize: 22.h,
                imageSize: 95.h,
                left: 13,
                icon: AppImages.innTechDark,
              ),
            ),
            19.h.verticalSpace,
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 11.h,
                bottom: 11.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.white.withOpacity(0.1),
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: _createMailController
                        .subjectMessageTextEditingController,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.white,
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 1,
                    cursorColor: AppColors.gray1,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      hintText: 'Subject Message Here',
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.white.withOpacity(0.56),
                      ),
                    ),
                    autocorrect: false,
                    enableSuggestions: false,
                    enabled: true,
                    enableInteractiveSelection: true,
                  ),
                  5.h.verticalSpace,
                  const Divider(
                    height: 1,
                    color: AppColors.white,
                    thickness: 1,
                  ),
                  10.h.verticalSpace,
                  TextFormField(
                    controller:
                        _createMailController.bodyMessageTextEditingController,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.white,
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    cursorColor: AppColors.gray1,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      hintText: 'Write Your Message',
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.white.withOpacity(0.56),
                      ),
                    ),
                    autocorrect: false,
                    enableSuggestions: false,
                    enabled: true,
                    enableInteractiveSelection: true,
                  ),
                  const Divider(
                    height: 1,
                    color: AppColors.white,
                    thickness: 1,
                  ),
                ],
              ),
            ),
            31.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 88.h,
                  height: 88.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.h),
                    color: AppColors.white.withOpacity(0.1),
                  ),
                  child: Column(
                    children: [
                      10.h.verticalSpace,
                      Text(
                        'Upload file',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                      ),
                      13.h.verticalSpace,
                      Image.asset(
                        AppImages.upload,
                        height: 29,
                      )
                    ],
                  ),
                ),
                15.horizontalSpace,
                Container(
                  width: 88.h,
                  height: 88.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.h),
                    color: AppColors.white.withOpacity(0.1),
                  ),
                  child: Column(
                    children: [
                      10.h.verticalSpace,
                      Text(
                        'Print',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                      ),
                      13.h.verticalSpace,
                      Image.asset(
                        AppImages.print,
                        height: 29,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
          color: AppColors.primary,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              18.h.verticalSpace,
              CustomButton(
                text: 'Send',
                onClick: _createMailController.onClickSend,
              ),
              18.h.verticalSpace,
              CustomButton(
                text: 'Back',
                onClick: _createMailController.onClickBack,
                isPrimary: false,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
