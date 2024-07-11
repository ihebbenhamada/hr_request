import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/sign-in-out/main/model/sign_in_out.dart';
import 'package:request_hr/app/sign-in-out/sign-in-out-details/screens/sign_in_out_details_screen.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/sign_in_out_service.dart';

class SignInOutController extends BaseController {
  /// SERVICES
  final SignInOutService _signInOutService = SignInOutService();

  /// CONTROLLERS

  /// VARIABLES
  RxList<SignInOut> signInOutList = <SignInOut>[].obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {
    getSignInoutList();
  }

  /// FUNCTIONS
  getSignInoutList() {
    AppInterceptor.showLoader();
    _signInOutService.getSignInOutList().then((value) {
      if (value != null) {
        signInOutList.value = value;
      }
      AppInterceptor.hideLoader();
    });
  }

  onClickSignInOutItem({required SignInOut item}) {
    Get.to(
      () => SignInOutDetailsScreen(
        screenTitle: "details",
      ),
      arguments: item,
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  void navigateAndRefresh() async {
    final result = await Get.to(
      () => SignInOutDetailsScreen(
        screenTitle: "create_signin_out",
      ),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
    if (result != null) {
      getSignInoutList();
    }
  }
}
