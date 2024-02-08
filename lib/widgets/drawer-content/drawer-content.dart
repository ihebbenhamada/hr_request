import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/main/controller/dashboard-controller.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/drawer-grid-item/drawer_grid_item.dart';
import 'package:request_hr/widgets/footer/footer.dart';

import '../../config/colors/colors.dart';
import '../header-drawer/header_drawer.dart';

class DrawerContent extends StatelessWidget {
  DrawerContent({
    super.key,
    required this.scaffoldKey,
  });
  GlobalKey<ScaffoldState> scaffoldKey;
  final DashboardController _dashboardController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: AppColors.primary,
      child: Padding(
        padding: EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 10.h,
          top: MediaQuery.of(context).viewPadding.top + 10.h,
        ),
        child: Column(
          children: [
            HeaderDrawer(
              closeDrawer: () {
                scaffoldKey.currentState!.closeDrawer();
              },
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 9.h, left: 9.h, bottom: 9.h),
                decoration: const BoxDecoration(
                  color: AppColors.blueDark,
                  image: DecorationImage(
                    image: AssetImage(AppImages.poster),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '21Dec., 2024',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20.sp,
                      ),
                    ),
                    14.h.verticalSpace,
                    Row(
                      children: [
                        Container(
                          height: 25.h,
                          width: 25.h,
                          decoration: const ShapeDecoration(
                            shape: OvalBorder(),
                            color: AppColors.primary,
                          ),
                          child: Center(
                            child: Image.asset(
                              AppImages.startJob,
                              height: 13.h,
                              width: 13.h,
                            ),
                          ),
                        ),
                        5.horizontalSpace,
                        Text(
                          'Start Job: 22-3-2023',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    5.h.verticalSpace,
                    Row(
                      children: [
                        Container(
                          height: 25.h,
                          width: 25.h,
                          decoration: const ShapeDecoration(
                            shape: OvalBorder(),
                            color: AppColors.primary,
                          ),
                          child: Center(
                            child: Image.asset(
                              AppImages.codeEmployee,
                              height: 13.h,
                              width: 13.h,
                            ),
                          ),
                        ),
                        5.horizontalSpace,
                        Text(
                          'Job Code: 54545',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            10.h.verticalSpace,
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // number of items in each row
                mainAxisSpacing: 8.h, // spacing between rows
                crossAxisSpacing: 35.0.w, // spacing between columns
              ),
              padding: const EdgeInsets.only(left: 22.0, right: 22),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true, // padding around the grid
              itemCount: _dashboardController
                  .drawerItems.length, // total number of items
              itemBuilder: (context, index) {
                Map<String, dynamic> item =
                    _dashboardController.drawerItems[index];
                return DrawerGridItem(
                  title: item['title'],
                  icon: item['icon'],
                  iconWidth: item['icon_width'],
                  iconHeight: item['icon_height'],
                );
              },
            ),
            const Expanded(child: Footer()),
          ],
        ),
      ),
    );
  }
}
