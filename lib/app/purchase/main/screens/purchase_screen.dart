import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/widgets/vacation_categories.dart';
import 'package:request_hr/app/purchase/main/controllers/purchase_controller.dart';
import 'package:request_hr/app/purchase/main/models/purchase.dart';
import 'package:request_hr/app/purchase/widgets/purchase_item.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/config/theme/theme_controller.dart';

class PurchaseScreen extends StatelessWidget {
  final _purchaseController = Get.put(PurchaseController());
  final ThemeController _themeController = Get.find();
  PurchaseScreen({super.key});
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
                  'request_purchase'.tr,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16.sp,
                  ),
                ),
                GestureDetector(
                  onTap: _purchaseController.onClickCreatePurchase,
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
              selectedFilter: _purchaseController.selectedFilter,
              onSelectFilter: (int index) =>
                  _purchaseController.onSelectFilter(index),
            ),
            30.h.verticalSpace,
            Expanded(
              child: RefreshIndicator(
                onRefresh: _purchaseController.handleRefresh,
                color: AppColors.white,
                backgroundColor: AppColors.primary,
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      child: Obx(
                        () => _purchaseController.purchaseList.isNotEmpty
                            ? GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      3, // number of items in each row
                                  mainAxisSpacing: 11.h, // spacing between rows
                                  crossAxisSpacing: 11.h,
                                  mainAxisExtent: 135.h,
                                ),
                                padding: EdgeInsets.only(
                                  bottom: Platform.isIOS ? 70.h : 84.h,
                                ),
                                shrinkWrap: true, // padding around the grid
                                itemCount:
                                    _purchaseController.purchaseList.length,
                                // total number of items
                                itemBuilder: (context, index) {
                                  Purchase item =
                                      _purchaseController.purchaseList[index];
                                  return Center(
                                    child: PurchaseItem(
                                      title: item.serialPrefix,
                                      date: item.orderDate,
                                      status: item.fkStStatusId,
                                      onClick: _purchaseController
                                          .onClickPurchaseItem,
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: Text(
                                  'no_purchase_found'.tr,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
