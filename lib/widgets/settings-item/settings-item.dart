import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/colors/colors.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    Key? key,
    required this.icon,
    this.isEnabled,
    required this.title,
    required this.description,
    this.onToggleSwitch,
    this.onClickItem,
    this.isDarkMode = false,
  }) : super(key: key);

  final String icon;
  final bool? isEnabled;
  final bool isDarkMode;
  final String title;
  final String description;
  final void Function(bool value)? onToggleSwitch;
  final void Function()? onClickItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClickItem,
      child: Container(
        height: (MediaQuery.of(context).size.width - 80) / 2,
        width: (MediaQuery.of(context).size.width - 80) / 2,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.dark1 : AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(0, 0, 0, 0.1),
              offset: const Offset(0.0, 1),
              blurRadius: 10.0.h,
              spreadRadius: 0.h,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  icon,
                  height: 28,
                  width: 28,
                  color: isDarkMode ? AppColors.white : AppColors.primary,
                ),
                isEnabled != null
                    ? SizedBox(
                        height: 16,
                        width: 33,
                        child: Transform.scale(
                          scale: 0.7,
                          child: CupertinoSwitch(
                            value: isEnabled!,
                            activeColor: AppColors.primary,
                            onChanged: (value) => onToggleSwitch!(value),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title.tr,
                  style: TextStyle(
                    color: isDarkMode ? AppColors.white : AppColors.blueDark,
                    fontSize: 16.sp,
                  ),
                ),
                6.h.verticalSpace,
                Text(
                  description.tr,
                  style: TextStyle(
                    color: isDarkMode ? AppColors.gray1 : AppColors.blueDark,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
