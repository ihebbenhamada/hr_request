import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/main/controllers/meetings_controller.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/main/model/meeting_response.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/widgets/vacation_categories.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/config/theme/theme_controller.dart';

import '../widgets/meeting_grid_item.dart';

class MeetingsScreen extends StatelessWidget {
  final _meetingsController = Get.put(MeetingsController());
  final ThemeController themeController = Get.find();
  MeetingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Create\nNew Meeting',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16.sp,
                  ),
                ),
                GestureDetector(
                  onTap: _meetingsController.navigateAndRefresh,
                  child: Image.asset(
                    AppImages.addDecision,
                    height: 34.h,
                    width: 34.h,
                  ),
                )
              ],
            ),
            20.h.verticalSpace,
            CategoriesFilter(
              selectedFilter: _meetingsController.selectedFilter,
              onSelectFilter: (int index) =>
                  _meetingsController.onSelectFilter(index),
            ),
            28.h.verticalSpace,
            Obx(
              () => Expanded(
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
                  itemCount: _meetingsController
                      .meetingList.length, // total number of items
                  itemBuilder: (context, index) {
                    MeetingResponse item =
                        _meetingsController.meetingList[index];
                    return MeetingGridItem(
                      employeeName: item.assigneeByName ?? "",
                      employeePosition: item.meetingTitle ?? "",
                      employeeImage: AppImages.profile,
                      type: item.fkReqStatusId,
                      date: item.creationDate.toString().substring(0, 10),
                      onClick: () =>
                          _meetingsController.onClickMeetingItem(item),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
