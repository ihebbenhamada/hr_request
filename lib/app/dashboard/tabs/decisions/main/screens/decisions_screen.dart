import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

import '../../../../../../config/colors/colors.dart';
import '../../../../../../widgets/decision-grid-item/decision_grid_item.dart';
import '../controllers/decisions_controller.dart';

class DecisionsScreen extends StatelessWidget {
  final _decisionsController = Get.put(DecisionsController());
  DecisionsScreen({super.key});
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
                  'Administrator  Decisions',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16.sp,
                  ),
                ),
                GestureDetector(
                  onTap: _decisionsController.onClickDecision,
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
                itemCount: _decisionsController
                    .decisionList.length, // total number of items
                itemBuilder: (context, index) {
                  Map<String, dynamic> item =
                      _decisionsController.decisionList[index];
                  return DecisionGridItem(
                    employeeName: item['employee_name'],
                    employeePosition: item['employee_position'],
                    employeeImage: item['employee_image'],
                    date: item['date'],
                    editable: item['editable'],
                    onClick: _decisionsController.onClickDecision,
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
