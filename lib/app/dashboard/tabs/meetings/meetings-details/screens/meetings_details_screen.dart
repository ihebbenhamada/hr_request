import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/meetings-details/widgets/meeting_point_item.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';
import 'package:request_hr/widgets/input/input_form.dart';

import '../../../../../../config/colors/colors.dart';
import '../controllers/meetings_details_controller.dart';

class MeetingsDetailsScreen extends StatelessWidget {
  final _meetingsDetailsController = Get.put(MeetingsDetailsController());
  MeetingsDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray2,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: 90.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: SizedBox(
                height: 111.h,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      width: 360.w,
                      height: 80.h,
                      padding: const EdgeInsets.only(left: 25),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        image: DecorationImage(
                          image: AssetImage(AppImages.poster),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 20.h,
                                width: 20.h,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20.h),
                                  border: Border.all(color: AppColors.blue1),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    AppImages.employee,
                                    height: 12.5.h,
                                    width: 12,
                                  ),
                                ),
                              ),
                              4.horizontalSpace,
                              Text(
                                'Mohamed Ismail ',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          5.h.verticalSpace,
                          Row(
                            children: [
                              Container(
                                height: 20.h,
                                width: 20.h,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20.h),
                                  border: Border.all(color: AppColors.blue1),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    AppImages.position,
                                    height: 10.7.h,
                                    width: 13.3,
                                  ),
                                ),
                              ),
                              4.horizontalSpace,
                              Text(
                                'project Manager',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          5.h.verticalSpace,
                          Row(
                            children: [
                              Container(
                                height: 20.h,
                                width: 20.h,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20.h),
                                  border: Border.all(color: AppColors.blue1),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    AppImages.cal,
                                    height: 8.h,
                                    width: 8.h,
                                  ),
                                ),
                              ),
                              4.horizontalSpace,
                              Text(
                                '19/5/2024',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: AvatarCircle(
                        image: AppImages.avatar3,
                        size: 112.h,
                        iconSize: 22.h,
                        imageSize: 95.h,
                        left: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            40.h.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InputForm(
                        height: 55.h,
                        width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                        title: 'Date',
                        inputType: 'text',
                        text: '12-05-2024',
                      ),
                      InputForm(
                        height: 55.h,
                        width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                        title: 'Depart',
                        inputType: 'text',
                        text: 'It Solutions',
                      ),
                    ],
                  ),
                  13.h.verticalSpace,
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const InputForm(
                        paddingRight: 36.0,
                        paddingBottom: 11,
                        width: double.infinity,
                        title: 'Invitation To',
                        inputType: 'text',
                        text:
                            'Dina Ali Ibraim. ali Samir Mohsen, Yaseer Ibrahim Ali',
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0, bottom: 6.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 20.h,
                              width: 20.h,
                              decoration: const ShapeDecoration(
                                shape: OvalBorder(
                                  side: BorderSide(color: AppColors.gray3),
                                ),
                              ),
                              child: Center(
                                child: Image.asset(AppImages.profile),
                              ),
                            ),
                            Container(
                              height: 20.h,
                              width: 20.h,
                              decoration: const ShapeDecoration(
                                shape: OvalBorder(
                                  side: BorderSide(color: AppColors.gray3),
                                ),
                              ),
                              child: Center(
                                child: Image.asset(AppImages.avatar3),
                              ),
                            ),
                            Container(
                              height: 20.h,
                              width: 20.h,
                              decoration: const ShapeDecoration(
                                shape: OvalBorder(
                                  side: BorderSide(color: AppColors.gray3),
                                ),
                              ),
                              child: Center(
                                child: Image.asset(AppImages.avatar2),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  13.h.verticalSpace,
                  InputForm(
                    height: 55.h,
                    width: double.infinity,
                    title: 'Meeting Title',
                    inputType: 'text',
                    text: 'Emergency Meeting',
                  ),
                  13.h.verticalSpace,
                  const InputForm(
                    width: double.infinity,
                    title: 'Meeting Subject',
                    inputType: 'input',
                  ),
                  22.h.verticalSpace,
                  Container(
                    width: double.infinity,
                    height: 44.h,
                    padding: EdgeInsets.all(3.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: AppColors.primary,
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
                      children: [
                        Container(
                          height: 38.h,
                          width: 38.h,
                          decoration: const ShapeDecoration(
                            shape: OvalBorder(),
                            color: AppColors.white,
                          ),
                          child: Center(
                            child: Image.asset(
                              AppImages.list,
                              height: 8.6.h,
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        Text(
                          'Meeting Points',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  19.h.verticalSpace,
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 17.0.h),
                        child: InputForm(
                          width: double.infinity,
                          title: 'Add Meeting Points',
                          inputType: 'input',
                          nbrLines: 2,
                          textEditingController: _meetingsDetailsController
                              .meetingPointTextEditingController,
                        ),
                      ),
                      Positioned(
                        right: 31,
                        bottom: 0.h,
                        child: InkWell(
                          onTap: () =>
                              _meetingsDetailsController.addMeetingPoint(),
                          child: Container(
                            height: 34.h,
                            width: 34.h,
                            decoration: const ShapeDecoration(
                              color: AppColors.white,
                              shape: OvalBorder(
                                side: BorderSide(
                                  color: AppColors.gray2,
                                  width: 3,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                AppImages.add,
                                height: 12.h,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.h.verticalSpace,
                  Obx(
                    () => ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        String name =
                            _meetingsDetailsController.meetingPointList[index];
                        return MeetingPointItem(name: name);
                      },
                      separatorBuilder: (context, index) {
                        return 13.h.verticalSpace;
                      },
                      itemCount:
                          _meetingsDetailsController.meetingPointList.length,
                    ),
                  ),
                  25.h.verticalSpace,
                  GestureDetector(
                    onTap: _meetingsDetailsController.uploadAttachment,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 162,
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: AppColors.primary,
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
                          children: [
                            11.horizontalSpace,
                            Image.asset(
                              AppImages.upload,
                              height: 17.h,
                            ),
                            10.horizontalSpace,
                            Text(
                              'Upload Attachment',
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
                  20.h.verticalSpace,
                  SizedBox(
                    height: 100.h,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _meetingsDetailsController.files.length,
                      itemBuilder: (context, index) {
                        return Image.file(
                          File(
                            _meetingsDetailsController.files[index].path,
                          ),
                          fit: BoxFit.cover,
                          width: 100.h,
                          height: 100.h,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return 10.horizontalSpace;
                      },
                    ),
                  ),
                  30.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50.h,
                        width: 50.h,
                        decoration: const ShapeDecoration(
                          color: AppColors.primary,
                          shape: OvalBorder(),
                        ),
                        child: Center(
                          child: Image.asset(
                            AppImages.tick,
                            color: AppColors.white,
                            height: 30.h,
                          ),
                        ),
                      ),
                      23.horizontalSpace,
                      GestureDetector(
                        onTap: () {
                          Get.back(id: 4);
                        },
                        child: Container(
                          height: 50.h,
                          width: 50.h,
                          decoration: const ShapeDecoration(
                            color: AppColors.blueDark,
                            shape: OvalBorder(),
                          ),
                          child: Center(
                            child: Image.asset(
                              AppImages.x,
                              color: AppColors.white,
                              height: 20.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
