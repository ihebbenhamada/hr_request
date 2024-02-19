import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../config/colors/colors.dart';

class LoanStatisticsContainer extends StatelessWidget {
  LoanStatisticsContainer({super.key});
  final List<ChartData> chartData = [
    ChartData(
      'ben',
      200,
      AppColors.redLight,
    ),
    ChartData(
      'hobba',
      500,
      AppColors.blue3,
    ),
    ChartData(
      'iheb',
      900,
      AppColors.gray12,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14),
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
            width: (MediaQuery.of(context).size.width - 120) / 2,
            height: 120.h,
            child: Center(
              child: SfCircularChart(
                series: <CircularSeries>[
                  // Renders radial bar chart
                  RadialBarSeries<ChartData, String>(
                    gap: '15%',
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.xData,
                    yValueMapper: (ChartData data, _) => data.yData,
                    radius: '120%',
                    trackColor: AppColors.gray11,
                    pointColorMapper: (ChartData data, _) => data.color,
                    trackBorderWidth: 1,
                    maximumValue: 1000,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width - 78) / 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 12.h,
                        width: 12.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColors.gray12,
                        ),
                      ),
                      8.horizontalSpace,
                      Text(
                        'PENDING',
                        style: TextStyle(
                          color: AppColors.gray8,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  12.h.verticalSpace,
                  Row(
                    children: [
                      Container(
                        height: 12.h,
                        width: 12.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColors.blue3,
                        ),
                      ),
                      8.horizontalSpace,
                      Text(
                        'APPROVED',
                        style: TextStyle(
                          color: AppColors.gray8,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  12.h.verticalSpace,
                  Row(
                    children: [
                      Container(
                        height: 12.h,
                        width: 12.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColors.redLight,
                        ),
                      ),
                      8.horizontalSpace,
                      Text(
                        'Cancel',
                        style: TextStyle(
                          color: AppColors.gray8,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.xData, this.yData, this.color);
  final String xData;
  final num yData;
  final Color color;
}
