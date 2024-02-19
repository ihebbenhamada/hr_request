import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/complaint/main/controllers/complaint_controller.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/config/theme/theme_controller.dart';

import '../../../../widgets/carousel-slider/custom_dots-indicator.dart';
import '../../../evaluations/main/widgets/evaluation_item.dart';

class ComplaintScreen extends StatelessWidget {
  final _complaintController = Get.put(ComplaintController());
  final ThemeController _themeController = Get.find();
  ComplaintScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (MediaQuery.of(context).viewPadding.top + 20).h.verticalSpace,
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              height: 40.h,
              width: 40.h,
              margin: const EdgeInsets.only(left: 25),
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 25.0,
                left: 25.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Create Complaint',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 16.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: _complaintController.onClickCreateComplaint,
                        child: Image.asset(
                          AppImages.addDecision,
                          height: 34.h,
                          width: 34.h,
                        ),
                      )
                    ],
                  ),
                  20.h.verticalSpace,
                  CarouselSlider.builder(
                    itemCount:
                        _complaintController.carouselComplaintList.length + 1,
                    itemBuilder: (context, index, i) {
                      if (index ==
                          _complaintController.carouselComplaintList.length) {
                        // Display fake item at the last index
                        return const SizedBox();
                      } else {
                        Map<String, dynamic> item =
                            _complaintController.carouselComplaintList[index];
                        // Display real items
                        return EvaluationItem(
                          employeeName: item['employee_name'],
                          employeePosition: item['employee_position'],
                          employeeImage: item['employee_image'],
                          date: item['date'],
                          editable: true,
                          onClick: _complaintController.onClickItemComplaint,
                        );
                      }
                    },
                    options: CarouselOptions(
                      height: 170.h,
                      animateToClosest: true,
                      clipBehavior: Clip.none,
                      viewportFraction: 0.45,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlay: false,
                      enlargeCenterPage: false,
                      padEnds: false,
                      pageSnapping: false,
                      onPageChanged: (index, reason) => _complaintController
                          .onChangeComplaintCarousel(index, reason),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  20.h.verticalSpace,
                  CustomDotsIndicator(
                    current: _complaintController.currentComplaint,
                    length: _complaintController.carouselComplaintList.length,
                  ),
                  20.h.verticalSpace,
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 14.h, bottom: 23.h, left: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x29000000),
                          blurRadius: 3,
                          offset: Offset(0, 3),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Complaint Chart',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.primary,
                          ),
                        ),
                        20.h.verticalSpace,
                        Obx(
                          () => Container(
                            height: 162.h,
                            padding: const EdgeInsets.only(right: 16),
                            child: Center(
                              child: BarChart(
                                BarChartData(
                                  backgroundColor: AppColors.white,
                                  borderData: FlBorderData(
                                    border: const Border(
                                      left: BorderSide(color: AppColors.gray7),
                                      bottom:
                                          BorderSide(color: AppColors.gray7),
                                    ),
                                  ),
                                  titlesData: FlTitlesData(
                                    topTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    rightTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 20,
                                        interval: 10,
                                        getTitlesWidget: (value, titleMeta) {
                                          return SideTitleWidget(
                                            axisSide: AxisSide.bottom,
                                            child: Text(
                                              value.toInt().toString(),
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                color: AppColors.gray8,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 25,
                                        interval: 10,
                                        getTitlesWidget: (value, titleMeta) {
                                          switch (value.toInt()) {
                                            case 1:
                                              return SideTitleWidget(
                                                axisSide: AxisSide.bottom,
                                                child: Text(
                                                  '2012',
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: AppColors.gray8,
                                                  ),
                                                ),
                                              );
                                            case 2:
                                              return SideTitleWidget(
                                                axisSide: AxisSide.bottom,
                                                child: Text(
                                                  '2013',
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: AppColors.gray8,
                                                  ),
                                                ),
                                              );
                                            case 3:
                                              return SideTitleWidget(
                                                axisSide: AxisSide.bottom,
                                                child: Text(
                                                  '2014',
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: AppColors.gray8,
                                                  ),
                                                ),
                                              );
                                            case 4:
                                              return SideTitleWidget(
                                                axisSide: AxisSide.bottom,
                                                child: Text(
                                                  '2015',
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: AppColors.gray8,
                                                  ),
                                                ),
                                              );
                                            case 5:
                                              return SideTitleWidget(
                                                axisSide: AxisSide.bottom,
                                                child: Text(
                                                  '2016',
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: AppColors.gray8,
                                                  ),
                                                ),
                                              );
                                            case 6:
                                              return SideTitleWidget(
                                                axisSide: AxisSide.bottom,
                                                child: Text(
                                                  '2017',
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: AppColors.gray8,
                                                  ),
                                                ),
                                              );
                                            // Add more cases as needed...
                                            default:
                                              return SideTitleWidget(
                                                axisSide: AxisSide.bottom,
                                                child: Text(
                                                  'no month',
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: AppColors.gray8,
                                                  ),
                                                ),
                                              );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  gridData: const FlGridData(
                                    show: false,
                                    horizontalInterval: 10,
                                    verticalInterval: 10,
                                  ),
                                  barGroups: [
                                    _complaintController.generateGroupData(
                                        1, 30),
                                    _complaintController.generateGroupData(
                                        2, 40),
                                    _complaintController.generateGroupData(
                                        3, 35),
                                    _complaintController.generateGroupData(
                                        4, 35),
                                    _complaintController.generateGroupData(
                                        5, 35),
                                    _complaintController.generateGroupData(
                                        6, 35),
                                  ],
                                  barTouchData: BarTouchData(
                                    touchTooltipData: BarTouchTooltipData(
                                      tooltipBgColor: AppColors.white,
                                      direction: TooltipDirection.top,
                                      tooltipPadding: EdgeInsets.zero,
                                      tooltipMargin: 0,
                                      getTooltipItem: (a, b, c, d) {
                                        return BarTooltipItem(
                                          '',
                                          TextStyle(
                                            color:
                                                AppColors.white.withOpacity(0),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  14.h.verticalSpace,
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 14),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(13.h),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 202.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your Complaint this year ',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 16.sp,
                                ),
                              ),
                              5.h.verticalSpace,
                              Text(
                                'Sorry. The Complaint sent to you during this year',
                                style: TextStyle(
                                  color: AppColors.blueDark,
                                  fontSize: 12.sp,
                                ),
                              ),
                              32.h.verticalSpace,
                              Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Container(
                                    width: 120,
                                    height: 21.h,
                                    padding: const EdgeInsets.only(left: 25),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(11.h),
                                      color: AppColors.primary,
                                    ),
                                    child: Text(
                                      'Total:475/700',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 21.h,
                                    height: 21.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(21.h),
                                      border:
                                          Border.all(color: AppColors.primary),
                                      color: AppColors.white,
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        AppImages.evaluationsDrawer,
                                        height: 9.5.h,
                                        color: AppColors.blueDark,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Image.asset(
                          AppImages.complaintChart,
                          height: 76.h,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
