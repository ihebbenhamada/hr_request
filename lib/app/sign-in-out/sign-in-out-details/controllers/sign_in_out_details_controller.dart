import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:request_hr/app/sign-in-out/main/model/sign_in_out.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/colors/colors.dart';
import '../services/sign_in_out_details_service.dart';

class SignInOutDetailsController extends BaseController {
  /// SERVICES
  final SignInOutDetailsService _signInOutDetailsService =
      SignInOutDetailsService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt selectedType = 0.obs;
  SignInOut? signInOutDetails = Get.arguments;
  Rx<DateTime> signDate = DateTime.now().obs;
  RxString time = "".obs;
  RxString locationTitle = "".obs;
  RxString area = "".obs;

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
    if (signInOutDetails != null) {
      selectedType.value = int.parse(signInOutDetails!.attendType ?? "0");
      signDate.value = DateTime.parse(signInOutDetails!.signDate);
      time.value = signInOutDetails!.signTime.substring(0, 8);
      locationTitle.value = signInOutDetails!.location ?? "";
      area.value = signInOutDetails!.areaName;
    } else {
      AppInterceptor.showLoader();
      time.value = DateFormat('kk:mm').format(DateTime.now());
      _determinePosition().then((value) async {
        locationTitle.value =
            "Latitude: ${value.latitude}, Longitude: ${value.longitude}";
        List<Placemark> placemarks =
            await placemarkFromCoordinates(value.latitude, value.longitude);
        area.value =
            '${placemarks[0].thoroughfare}, ${placemarks[0].locality},${placemarks[0].country}';
        AppInterceptor.hideLoader();
      });
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  /// FUNCTIONS
  void selectDate(
    BuildContext context,
  ) async {
    final DateTime? pickedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary, // header background color
              onPrimary: AppColors.white, // header text color
              onSurface: AppColors.black, // body text color
            ),
            textTheme: Theme.of(context).textTheme.copyWith(
                  bodyLarge: TextStyle(fontSize: 14.sp),
                ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != signDate.value) {
      signDate.value = pickedDate;
    }
  }

  onSelectType(int value) {
    selectedType.value = value;
  }

  onClickSubmit() {
    _signInOutDetailsService
        .createSignInOut(
      areaName: area.value,
      attendType: selectedType.value.toString(),
      location: locationTitle.value,
    )
        .then((value) {
      if (value != null) {
        Get.back(result: 'refresh');
      }
    });
  }

  onClickBack() {
    Get.back();
  }
}
