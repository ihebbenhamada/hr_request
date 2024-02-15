import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

class TicketExchangeRequest extends StatefulWidget {
  const TicketExchangeRequest({super.key});

  @override
  State<TicketExchangeRequest> createState() => _TicketExchangeRequestState();
}

class _TicketExchangeRequestState extends State<TicketExchangeRequest> {
  final List<String> paymentTypeList = ['Annual', 'Monthly', 'Weekly', 'daily'];
  String selectedType = 'Annual';
  onSelectPaymentType(String value) {
    setState(() {
      selectedType = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.h),
              color: AppColors.white.withOpacity(0.1),
            ),
            child: Column(
              children: [
                14.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.38,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment Type',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                          10.h.verticalSpace,
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isDense: true,
                              value: selectedType ?? '',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14.sp,
                              ),
                              isExpanded: true,
                              padding: EdgeInsets.zero,
                              icon: Image.asset(
                                AppImages.arrowDown,
                                height: 8.h,
                                color: AppColors.white,
                              ),
                              dropdownColor: AppColors.blueDark,
                              onChanged: (String? newValue) =>
                                  onSelectPaymentType(newValue ?? ''),
                              items: paymentTypeList
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          const Divider(
                            height: 1,
                            color: AppColors.white,
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.38,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Due Date',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                          TextFormField(
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                            keyboardType: TextInputType.number,
                            cursorColor: AppColors.white,
                            decoration: const InputDecoration(
                              isDense: true,
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                            initialValue: '20-10-2024',
                            autocorrect: false,
                            enableSuggestions: false,
                            enabled: false,
                            enableInteractiveSelection: true,
                          ),
                          const Divider(
                            height: 1,
                            color: AppColors.white,
                            thickness: 1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                20.h.verticalSpace,
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                        keyboardType: TextInputType.number,
                        cursorColor: AppColors.white,
                        decoration: const InputDecoration(
                          isDense: true,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                        maxLines: 5,
                        autocorrect: false,
                        enableSuggestions: false,
                        enabled: true,
                        enableInteractiveSelection: true,
                      ),
                      const Divider(
                        height: 1,
                        color: AppColors.white,
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
                23.h.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
