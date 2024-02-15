import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    super.key,
    this.selectedDropDownItem,
    this.onSelect,
    this.listDropDown,
    required this.title,
    this.text,
    required this.inputType,
    this.width,
    this.height,
    this.textEditingController,
    this.onSelectDate,
    this.paddingRight,
    this.paddingTop,
    this.paddingBottom,
    this.paddingLeft,
    this.nbrLines,
  });

  final RxString? selectedDropDownItem;
  final void Function(String value)? onSelect;
  final List<String>? listDropDown;
  final String title;
  final String? text;
  final String inputType;
  final double? width;
  final double? paddingRight;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingLeft;
  final double? height;
  final int? nbrLines;
  final TextEditingController? textEditingController;
  final void Function()? onSelectDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.only(
        left: paddingLeft ?? 11,
        right: paddingRight ?? 11,
        bottom: paddingBottom ?? 0,
        top: paddingTop ?? 0,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.h),
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
        mainAxisAlignment: inputType == 'input'
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        children: [
          inputType == 'input' ? 5.h.verticalSpace : 0.h.verticalSpace,
          Text(
            title,
            style: TextStyle(
              color: AppColors.gray6,
              fontSize: 14.sp,
            ),
          ),
          inputType == 'input' ? 0.h.verticalSpace : 3.verticalSpace,
          renderWidget(inputType),
        ],
      ),
    );
  }

  Widget renderWidget(String inputType) {
    switch (inputType) {
      case 'select':
        return Obx(
          () => DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isDense: true,
              value: selectedDropDownItem?.value ?? '',
              style: TextStyle(
                color: AppColors.blueDark,
                fontSize: 14.sp,
              ),
              isExpanded: true,
              alignment: Alignment.bottomCenter,
              icon: Image.asset(
                AppImages.arrowDown,
                height: 8.h,
              ),
              onChanged: (String? newValue) => onSelect!(newValue ?? ''),
              items:
                  listDropDown?.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  alignment: Alignment.centerLeft,
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        );
      case 'text':
        return Text(
          text ?? '',
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.blueDark,
          ),
        );
      case 'date':
        return GestureDetector(
          onTap: onSelectDate,
          behavior: HitTestBehavior.opaque,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text ?? '',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.blueDark,
                ),
              ),
              Image.asset(
                AppImages.calender,
                height: 13.h,
              ),
            ],
          ),
        );
      case 'input':
        return TextFormField(
          key: key,
          controller: textEditingController,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.blueDark,
          ),
          keyboardType: TextInputType.multiline,
          maxLines: nbrLines ?? 4,
          cursorColor: AppColors.gray1,
          decoration: const InputDecoration(
            isDense: true,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
          ),
          autocorrect: false,
          enableSuggestions: false,
          enabled: true,
          enableInteractiveSelection: true,
        );
      default:
        return SizedBox();
    }
  }
}
