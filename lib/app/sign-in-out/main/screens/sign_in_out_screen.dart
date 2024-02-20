import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/sign-in-out/main/controllers/sign_in_out_controller.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/sign-in-out-grid-item/sign_in_out_grid_item.dart';

import '../../../../../../config/colors/colors.dart';

class SignInOutScreen extends StatelessWidget {
  final _signInOutController = Get.put(SignInOutController());
  SignInOutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (MediaQuery.of(context).viewPadding.top + 20).h.verticalSpace,
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                height: 40.h,
                width: 40.h,
                decoration: const ShapeDecoration(
                  shape: OvalBorder(),
                  color: AppColors.primary,
                ),
                child: Center(
                  child: Image.asset(
                    AppImages.back,
                    height: 20.h,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            7.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sign in & Out',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16.sp,
                  ),
                ),
                GestureDetector(
                  onTap: _signInOutController.onClickCreateSignInOut,
                  child: Image.asset(
                    AppImages.addDecision,
                    height: 34.h,
                    width: 34.h,
                  ),
                )
              ],
            ),
            20.h.verticalSpace,
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // number of items in each row
                  mainAxisSpacing: 24.h, // spacing between rows
                  crossAxisSpacing: 20.0.h,
                  childAspectRatio: 0.9, // spacing between columns
                ),
                padding: EdgeInsets.only(
                  bottom: Platform.isIOS ? 70.h : 84.h,
                ),
                shrinkWrap: true, // padding around the grid
                itemCount: _signInOutController
                    .signInOutList.length, // total number of items
                itemBuilder: (context, index) {
                  Map<String, dynamic> item =
                      _signInOutController.signInOutList[index];
                  return SignInOutGridItem(
                    employeeName: item['employee_name'],
                    workPlace: item['work_place'],
                    type: item['type'],
                    date: item['date'],
                    time: item['time'],
                    onClick: _signInOutController.onClickSignInOutItem,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
