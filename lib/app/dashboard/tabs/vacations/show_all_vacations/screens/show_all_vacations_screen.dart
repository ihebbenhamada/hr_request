import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/vacation.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/show_all_vacations/controllers/show_all_vacations_controller.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/widgets/vacation_categories.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/config/theme/theme_controller.dart';

import '../../../../../../widgets/vacation-item/vacation_item.dart';

class ShowAllVacationsScreen extends StatelessWidget {
  final _showAllVacationsController = Get.put(ShowAllVacationsController());
  final ThemeController _themeController = Get.find();
  ShowAllVacationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                height: 40.h,
                width: 40.h,
                margin: EdgeInsets.only(
                  left: Get.locale?.languageCode == 'en' ? 25 : 0,
                  right: Get.locale?.languageCode == 'ar' ? 25 : 0,
                ),
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
            10.h.verticalSpace,
            !GetStorage().read('isChairman')
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 25.0,
                      right: 25,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${'create'.tr}\n${'new_vacation'.tr}',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16.sp,
                          ),
                        ),
                        GestureDetector(
                          onTap: _showAllVacationsController.navigateAndRefresh,
                          child: Image.asset(
                            AppImages.addDecision,
                            height: 34.h,
                            width: 34.h,
                          ),
                        )
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(
                      left: 25.0,
                      right: 25,
                    ),
                    child: Text(
                      'employees_vacations'.tr,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
            16.h.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(
                left: 25.0,
                right: 25,
              ),
              child: CategoriesFilter(
                selectedFilter: _showAllVacationsController.selectedFilter,
                onSelectFilter: (int index) =>
                    _showAllVacationsController.onSelectFilter(index),
              ),
            ),
            30.h.verticalSpace,
            Expanded(
              child: RefreshIndicator(
                onRefresh: _showAllVacationsController.handleRefresh,
                color: AppColors.white,
                backgroundColor: AppColors.primary,
                child: Obx(
                  () => GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // number of items in each row
                      mainAxisSpacing: 24.h, // spacing between rows
                      crossAxisSpacing: 24.0.h,
                      childAspectRatio: 0.9,
                    ),
                    padding: EdgeInsets.only(
                      bottom: (Platform.isIOS ? 50.h : 64.h) + 20.h,
                      left: 25,
                      right: 25,
                    ),
                    itemCount: _showAllVacationsController
                        .vacationsList.length, // total number of items
                    itemBuilder: (context, index) {
                      Vacation item =
                          _showAllVacationsController.vacationsList[index];
                      return VacationItem(
                        title: Get.locale?.languageCode == 'en'
                            ? "${item.vacationTypeNameEn}\n${'vacation'.tr}"
                            : "${'vacation'.tr}\n${item.vacationTypeNameAr}",
                        startDate: item.dateFrom.substring(0, 10),
                        endDate: item.dateTo.substring(0, 10),
                        icon: item.icon,
                        withAlert: item.withAlert,
                        color: item.color,
                        iconHeight: item.iconHeight,
                        onClick: () => _showAllVacationsController
                            .onClickVacationItem(item.vacationId),
                      );
                    },
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
