import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/custom-input/custom-input.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/theme/theme_controller.dart';
import '../../../../widgets/custom-button/custom-button.dart';
import '../../../../widgets/footer/footer.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final _authController = Get.put(LoginController());
  final ThemeController themeController = Get.find();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.bgLogin),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              opacity: 0.1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        113.h.verticalSpace,
                        Center(
                          child: Image.asset(
                            AppImages.loginIcon,
                            height: 125.h,
                          ),
                        ),
                        108.h.verticalSpace,
                        Text(
                          'sign_in'.tr.toUpperCase(),
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ),
                        10.h.verticalSpace,
                        Text(
                          'fill_credentials'.tr,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.gray1,
                          ),
                        ),
                        40.h.verticalSpace,
                        CustomInput(
                          controller: _authController.idTextEditingController,
                          isDarkMode: themeController.isDarkMode.value,
                          hintText: 'id_number'.tr,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          onChanged: (value) {},
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                              left: 22.0,
                              right: 15.0,
                            ),
                            child: Image.asset(
                              AppImages.phone,
                              height: 20.h,
                              width: 20.h,
                            ),
                          ),
                        ),
                        34.h.verticalSpace,
                        CustomInput(
                          controller:
                              _authController.passwordTextEditingController,
                          isDarkMode: themeController.isDarkMode.value,
                          hintText: 'password'.tr,
                          obscureText: true,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                              left: 22.0,
                              right: 15.0,
                            ),
                            child: Image.asset(
                              AppImages.lock,
                              height: 20.h,
                              width: 20.h,
                            ),
                          ),
                        ),
                        35.h.verticalSpace,
                        CustomButton(
                          text: 'login'.tr,
                          onClick: _authController.handleClickSignIn,
                        ),
                        19.h.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Footer(),
              ),
              10.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
