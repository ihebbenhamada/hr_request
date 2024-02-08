import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/colors/colors.dart';
import '../../config/image_urls/image_urls.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Flexible(
              child: Divider(
                color: AppColors.white,
                height: 1,
                thickness: 1,
                endIndent: 26,
              ),
            ),
            Image.asset(
              AppImages.innTechDark,
              height: 42.h,
            ),
            const Flexible(
              child: Divider(
                color: AppColors.white,
                height: 1,
                thickness: 1,
                indent: 26,
              ),
            ),
          ],
        ),
        10.h.verticalSpace,
        Center(
          child: Text(
            'Request System V1.1',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.gray,
            ),
          ),
        ),
      ],
    );
  }
}
