import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/widgets/vacation_categories.dart';
import 'package:request_hr/app/ticket/main/controllers/ticket_controller.dart';
import 'package:request_hr/app/ticket/widgets/ticket_item.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/config/theme/theme_controller.dart';

import '../models/ticket_response.dart';

class TicketScreen extends StatelessWidget {
  final _ticketController = Get.put(TicketController());
  final ThemeController _themeController = Get.find();
  TicketScreen({super.key});
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
                  'create_Ticket'.tr,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16.sp,
                  ),
                ),
                GestureDetector(
                  onTap: _ticketController.navigateAndRefresh,
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
              selectedFilter: _ticketController.selectedFilter,
              onSelectFilter: (int index) =>
                  _ticketController.onSelectFilter(index),
            ),
            30.h.verticalSpace,
            Expanded(
              child: RefreshIndicator(
                onRefresh: _ticketController.handleRefresh,
                color: AppColors.white,
                backgroundColor: AppColors.primary,
                child: Obx(
                  () => GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // number of items in each row
                      mainAxisSpacing: 11.h, // spacing between rows
                      crossAxisSpacing: 11.h,
                      mainAxisExtent: 135.h,
                    ),
                    padding: EdgeInsets.only(
                      bottom: Platform.isIOS ? 70.h : 84.h,
                    ),
                    shrinkWrap: true,
                    itemCount: _ticketController.ticketsList.length,
                    itemBuilder: (context, index) {
                      Ticket item = _ticketController.ticketsList[index];
                      return Center(
                        child: TicketItem(
                          title: "request_ticket".tr,
                          date: item.creationDate.substring(0, 10),
                          status: item.status,
                          onClick: () =>
                              _ticketController.onClickTicketItem(item),
                        ),
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
