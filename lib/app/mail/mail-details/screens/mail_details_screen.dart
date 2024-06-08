import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/mail/mail-details/controllers/mail_details_controller.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';
import 'package:request_hr/widgets/custom-button/custom-button.dart';

import '../../../../../config/theme/theme_controller.dart';

class MailDetailsScreen extends StatelessWidget {
  final _mailDetailsController = Get.put(MailDetailsController());
  final ThemeController themeController = Get.find();
  MailDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 25.0,
          right: 25,
          top: MediaQuery.of(context).viewPadding.top + 20.h,
          bottom: 190.h,
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
            20.h.verticalSpace,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.39,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.white,
                              ),
                            ),
                            Text(
                              _mailDetailsController.mail.value.senderName,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.39,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Job',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.white,
                              ),
                            ),
                            Text(
                              _mailDetailsController.mail.value.subject,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  5.h.verticalSpace,
                  Text(
                    _mailDetailsController.mail.value.description,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.white,
                    ),
                  ),
                  5.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: _mailDetailsController.onClickReplay,
                        child: Container(
                          width: 104,
                          padding: EdgeInsets.symmetric(vertical: 7.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.primary,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppImages.replayEmail,
                                  height: 16.h,
                                ),
                                11.horizontalSpace,
                                Text(
                                  'Replay',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      5.horizontalSpace,
                      GestureDetector(
                        onTap: _mailDetailsController.downloadFile,
                        child: Container(
                          width: 104,
                          padding: EdgeInsets.symmetric(vertical: 7.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.primary,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppImages.attachEmail,
                                  height: 16.h,
                                  color: AppColors.white,
                                ),
                                11.horizontalSpace,
                                Text(
                                  'Download',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Obx(
              () => _mailDetailsController.isReplay.value ||
                      _mailDetailsController.from.value == 'replay'
                  ? Column(
                      children: [
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
                                controller: _mailDetailsController
                                    .replaySubjectMessageTextEditingController,
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
                                controller: _mailDetailsController
                                    .replayBodyMessageTextEditingController,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.white,
                                ),
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
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
                    )
                  : const SizedBox(),
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
              Obx(
                () => _mailDetailsController.isReplay.value
                    ? Column(
                        children: [
                          18.h.verticalSpace,
                          CustomButton(
                            text: 'Replay',
                            onClick: _mailDetailsController.onClickSendReplay,
                          ),
                        ],
                      )
                    : const SizedBox(),
              ),
              18.h.verticalSpace,
              CustomButton(
                text: 'Back',
                onClick: _mailDetailsController.onClickBack,
                isPrimary: false,
              ),
              30.h.verticalSpace,
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
