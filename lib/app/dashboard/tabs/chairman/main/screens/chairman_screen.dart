import 'dart:io';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/config/theme/theme_controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../controllers/chairman_controller.dart';

class ChairmanScreen extends StatelessWidget {
  final _chairmanController = Get.put(ChairmanController());
  final ThemeController _themeController = Get.find();
  ChairmanScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray2,
      child: Padding(
          padding: const EdgeInsets.only(
            right: 25.0,
            left: 25.0,
          ),
          child: RefreshIndicator(
            onRefresh: _chairmanController.handleRefresh,
            color: AppColors.white,
            backgroundColor: AppColors.primary,
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: (Platform.isIOS ? 50.h : 64.h) + 20.h,
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 14.h,
                      bottom: 23.h,
                      left: Get.locale?.languageCode == 'en' ? 16 : 0,
                      right: Get.locale?.languageCode == 'ar' ? 16 : 0,
                    ),
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
                          'most_rated_emp'.tr,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.primary,
                          ),
                        ),
                        10.h.verticalSpace,
                        Obx(
                          () {
                            return Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 30.h,
                                child: Stack(
                                  clipBehavior: Clip.antiAlias,
                                  children: [
                                    AnimatedAlign(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      alignment: _chairmanController
                                              .isLowRatedSelected.value
                                          ? Alignment.centerLeft
                                          : Alignment.centerRight,
                                      child: Container(
                                        width: 80,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.gray2,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: _chairmanController
                                                .toggleLowRated,
                                            behavior:
                                                HitTestBehavior.translucent,
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 30.h,
                                              child: Text(
                                                'low_rated'.tr,
                                                style: TextStyle(
                                                  color: AppColors.gray8,
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            behavior:
                                                HitTestBehavior.translucent,
                                            onTap: _chairmanController
                                                .toggleMostRated,
                                            child: Container(
                                              height: 30.h,
                                              alignment: Alignment.center,
                                              child: Text(
                                                'most_rated'.tr,
                                                style: TextStyle(
                                                  color: AppColors.gray8,
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        10.h.verticalSpace,
                        Obx(
                          () => Container(
                            height: 162.h,
                            padding: const EdgeInsets.only(right: 16),
                            child: Center(
                              child: BarChart(
                                curve: Curves.bounceIn,
                                duration: const Duration(milliseconds: 0),
                                BarChartData(
                                  backgroundColor: AppColors.white,
                                  borderData: FlBorderData(
                                    border: const Border(
                                      left: BorderSide(
                                        color: AppColors.gray7,
                                      ),
                                      bottom: BorderSide(
                                        color: AppColors.gray7,
                                      ),
                                    ),
                                  ),
                                  titlesData: FlTitlesData(
                                    topTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    rightTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 25,
                                        interval: 10,
                                        getTitlesWidget: (value, titleMeta) {
                                          return Text(
                                            _chairmanController
                                                    .isLowRatedSelected.isTrue
                                                ? _chairmanController
                                                    .dashboardAdminData
                                                    .value
                                                    .lowRatedEvaluations[
                                                        value.toInt()]
                                                    .fullNmaeEn
                                                    .replaceAll(' ', '\n')
                                                : _chairmanController
                                                    .dashboardAdminData
                                                    .value
                                                    .mostRatedEvaluations[
                                                        value.toInt()]
                                                    .fullNmaeEn
                                                    .replaceAll(' ', '\n'),
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              color: AppColors.gray8,
                                            ),
                                            textAlign: TextAlign.center,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  gridData: const FlGridData(
                                    show: false,
                                    horizontalInterval: 10,
                                    verticalInterval: 10,
                                  ),
                                  barGroups: _chairmanController
                                          .isLowRatedSelected.isTrue
                                      ? _chairmanController
                                          .barGroupsLowRated.value
                                      : _chairmanController
                                          .barGroupsMostRated.value,
                                  barTouchData: BarTouchData(
                                    touchTooltipData: BarTouchTooltipData(
                                      direction: TooltipDirection.top,
                                      tooltipPadding: EdgeInsets.zero,
                                      tooltipMargin: 10,
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
                  15.h.verticalSpace,
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      top: 14.h,
                      bottom: 23.h,
                      left: Get.locale?.languageCode == 'en' ? 16 : 0,
                      right: Get.locale?.languageCode == 'ar' ? 16 : 0,
                    ),
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
                          'total_bonus_month'.tr,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.primary,
                          ),
                        ),
                        10.h.verticalSpace,
                        Obx(
                          () {
                            return Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 30.h,
                                child: Stack(
                                  clipBehavior: Clip.antiAlias,
                                  children: [
                                    AnimatedAlign(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      alignment: _chairmanController
                                              .isBonusSelected.value
                                          ? Alignment.centerLeft
                                          : Alignment.centerRight,
                                      child: Container(
                                        width: 80,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.gray2,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap:
                                                _chairmanController.toggleBonus,
                                            behavior:
                                                HitTestBehavior.translucent,
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 30.h,
                                              child: Text(
                                                'bonus'.tr,
                                                style: TextStyle(
                                                  color: AppColors.gray8,
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            behavior:
                                                HitTestBehavior.translucent,
                                            onTap: _chairmanController
                                                .togglePunishment,
                                            child: Container(
                                              height: 30.h,
                                              alignment: Alignment.center,
                                              child: Text(
                                                'punishment'.tr,
                                                style: TextStyle(
                                                  color: AppColors.gray8,
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        10.h.verticalSpace,
                        Obx(
                          () => Container(
                            height: 162.h,
                            padding: const EdgeInsets.only(right: 16),
                            child: LineChart(
                              LineChartData(
                                backgroundColor: AppColors.white,
                                gridData: FlGridData(
                                  drawVerticalLine: false,
                                  getDrawingHorizontalLine: (value) {
                                    return const FlLine(
                                      color: AppColors.gray5,
                                      strokeWidth: .5,
                                    );
                                  },
                                ),
                                titlesData: FlTitlesData(
                                  show: true,
                                  rightTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  topTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: _chairmanController
                                          .dashboardAdminData
                                          .value
                                          .bonuStatistics
                                          .isNotEmpty,
                                      reservedSize: 25,
                                      interval: 1,
                                      getTitlesWidget: (value, titleMeta) {
                                        return Text(
                                          _chairmanController
                                              .dashboardAdminData
                                              .value
                                              .bonuStatistics[value.toInt()]
                                              .month
                                              .toLowerCase()
                                              .tr,
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: AppColors.gray8,
                                          ),
                                          textAlign: TextAlign.center,
                                        );
                                      },
                                    ),
                                  ),
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      interval: 100000,
                                      getTitlesWidget: (value, titleMeta) {
                                        return SideTitleWidget(
                                          meta: TitleMeta(
                                            axisPosition: 0,
                                            appliedInterval: 30,
                                            axisSide: AxisSide.bottom,
                                            formattedValue: value.toString(),
                                            max: 1000000,
                                            min: 0,
                                            parentAxisSize: double.infinity,
                                            rotationQuarterTurns: 0,
                                            sideTitles: SideTitles(),
                                          ),
                                          child: Text(
                                            value.toInt().toString(),
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              color: AppColors.gray8,
                                            ),
                                          ),
                                        );
                                      },
                                      reservedSize: 35,
                                    ),
                                  ),
                                ),
                                borderData: FlBorderData(
                                  border: const Border(
                                    left: BorderSide(
                                      color: AppColors.gray7,
                                    ),
                                    bottom: BorderSide(
                                      color: AppColors.gray7,
                                    ),
                                  ),
                                ),
                                lineBarsData: [
                                  LineChartBarData(
                                    show: _chairmanController
                                        .spots.value.isNotEmpty,
                                    spots: _chairmanController.spots.value,
                                    isCurved: true,
                                    gradient: LinearGradient(
                                      colors:
                                          _chairmanController.gradientColors,
                                    ),
                                    barWidth: 3,
                                    isStrokeCapRound: true,
                                    dotData: const FlDotData(
                                      show: true,
                                    ),
                                    belowBarData: BarAreaData(
                                      show: true,
                                      gradient: LinearGradient(
                                        colors: _chairmanController
                                            .gradientColors
                                            .map((color) =>
                                                color.withOpacity(0.3))
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                ],
                                lineTouchData: LineTouchData(
                                  touchTooltipData: LineTouchTooltipData(
                                    tooltipPadding: EdgeInsets.all(5.h),
                                    tooltipMargin: 10.h,
                                    getTooltipColor: (lineBar) {
                                      return AppColors.white;
                                    },
                                    tooltipRoundedRadius: 100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  15.h.verticalSpace,
                  Container(
                    width: double.infinity,
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
                        Padding(
                          padding: EdgeInsets.only(
                            top: 14.h,
                            left: Get.locale?.languageCode == 'en' ? 16 : 0,
                            right: Get.locale?.languageCode == 'ar' ? 16 : 0,
                          ),
                          child: Text(
                            'vacation_taken_year'.tr,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        20.h.verticalSpace,
                        Obx(
                          () => Container(
                            height: 162.h,
                            clipBehavior: Clip.none,
                            child: Center(
                              child: SfRadialGauge(
                                enableLoadingAnimation: true,
                                axes: [
                                  RadialAxis(
                                    annotations: [
                                      GaugeAnnotation(
                                        widget: Text(
                                          '${_chairmanController.vacationTakenPercentage.value}%',
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            fontSize: 30.sp,
                                          ),
                                        ),
                                        positionFactor: 0,
                                        angle: 90,
                                      )
                                    ],
                                    axisLabelStyle: GaugeTextStyle(
                                      color: AppColors.gray15,
                                      fontSize: 10.sp,
                                    ),
                                    interval: 20,
                                    labelFormat: '{value}%',
                                    labelsPosition: ElementsPosition.outside,
                                    offsetUnit: GaugeSizeUnit.logicalPixel,
                                    radiusFactor: 1.4,
                                    showLabels: true,
                                    showTicks: false,
                                    showLastLabel: true,
                                    startAngle: 180,
                                    endAngle: 0,
                                    canScaleToFit: true,
                                    axisLineStyle: const AxisLineStyle(
                                      thickness: 40,
                                      color: AppColors.blue4,
                                      thicknessUnit: GaugeSizeUnit.logicalPixel,
                                      cornerStyle: CornerStyle.bothFlat,
                                    ),
                                    pointers: <GaugePointer>[
                                      RangePointer(
                                        value: _chairmanController
                                            .vacationTakenPercentage.value
                                            .toDouble(),
                                        width: 40,
                                        color: AppColors.primary,
                                        sizeUnit: GaugeSizeUnit.logicalPixel,
                                        cornerStyle: CornerStyle.bothFlat,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  15.h.verticalSpace,
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
                                'total_alert_year'.tr,
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 16.sp,
                                ),
                              ),
                              5.h.verticalSpace,
                              Text(
                                'total_alert_sent'.tr,
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
                                    height: 21.h,
                                    padding: const EdgeInsets.only(
                                        left: 25, right: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(11.h),
                                      color: AppColors.primary,
                                    ),
                                    child: Text(
                                      '${'total'.tr}: ${_chairmanController.dashboardAdminData.value.totalAlerts}',
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
                                      border: Border.all(
                                        color: AppColors.primary,
                                      ),
                                      color: AppColors.white,
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        AppImages.alertWhiteDrawer,
                                        height: 9.5.h,
                                        color: AppColors.blueDark,
                                        matchTextDirection: true,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Image.asset(
                          AppImages.alertChart,
                          height: 65.h,
                          matchTextDirection: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
