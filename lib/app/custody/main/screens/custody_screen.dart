import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/custody/main/controllers/custody_controller.dart';
import 'package:request_hr/app/custody/main/models/custody.dart';
import 'package:request_hr/app/custody/widget/custody_item.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/widgets/vacation_categories.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/config/theme/theme_controller.dart';

class CustodyScreen extends StatelessWidget {
  final _custodyController = Get.put(CustodyController());
  final ThemeController _themeController = Get.find();
  CustodyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray2,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
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
                    matchTextDirection: true,
                  ),
                ),
              ),
            ),
            7.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'request_custody'.tr,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16.sp,
                  ),
                ),
                GestureDetector(
                  onTap: _custodyController.navigateAndRefresh,
                  child: Image.asset(
                    AppImages.addDecision,
                    height: 34.h,
                    width: 34.h,
                  ),
                )
              ],
            ),
            16.h.verticalSpace,
            CategoriesFilter(
              selectedFilter: _custodyController.selectedFilter,
              onSelectFilter: (int index) =>
                  _custodyController.onSelectFilter(index),
            ),
            30.h.verticalSpace,
            RefreshIndicator(
              onRefresh: _custodyController.onRefresh,
              color: AppColors.white,
              backgroundColor: AppColors.primary,
              child: Obx(
                () => _custodyController.custodyList.isNotEmpty
                    ? GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // number of items in each row
                          mainAxisSpacing: 11.h, // spacing between rows
                          crossAxisSpacing: 11.h,
                          mainAxisExtent: 135.h,
                        ),
                        padding: EdgeInsets.only(
                          bottom: Platform.isIOS ? 70.h : 84.h,
                        ),
                        shrinkWrap: true, // padding around the grid
                        itemCount: _custodyController
                            .custodyList.length, // total number of items
                        itemBuilder: (context, index) {
                          Custody item = _custodyController.custodyList[index];
                          return Center(
                            child: CustodyItem(
                              title: item.custodyName,
                              date: item.dateCustody.substring(0, 10),
                              status: item.fkReqStatusId,
                              onClick: () =>
                                  _custodyController.onClickCustodyItem(item),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Text(
                          'no_custody_found'.tr,
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
