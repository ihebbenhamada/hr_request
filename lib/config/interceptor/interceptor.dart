import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';

import '../api-urls/end_points.dart';
import '../colors/colors.dart';

class AppInterceptor {
  static Dio? _dio;
  static ResponseType responseType = ResponseType.json;

  /// INTERCEPTOR SETUP
  static Dio? get dio {
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          baseUrl: EndPoints.BASE_URL,
          connectTimeout: const Duration(seconds: 15),
          sendTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 50),
        ),
      );

      _dio!.interceptors.add(
        InterceptorsWrapper(
          onRequest: (
            RequestOptions requestOptions,
            RequestInterceptorHandler handler,
          ) {
            showLoader();
            if (requestOptions.method == 'GET') {
              requestOptions.queryParameters.removeWhere(
                (key, value) => value == null,
              );
            }
            final GetStorage storage = GetStorage();
            String? token = storage.read('token');
            if (token != null) {
              requestOptions.headers['Authorization'] = 'Bearer $token';
            }

            responseType = responseType;
            requestOptions.headers.addAll({
              HttpHeaders.contentTypeHeader: "application/json",
            });
            handler.next(requestOptions);
            onRequestSent(requestOptions);
          },
          onResponse: (
            response,
            ResponseInterceptorHandler handler,
          ) {
            onResponseReceived(response);
            hideLoader();
            _reestablishDefaultConfig();
            handler.next(response);
          },
          onError: (
            DioException error,
            ErrorInterceptorHandler handler,
          ) {
            onResponseFailed(error);
            EasyLoading.dismiss();
            _reestablishDefaultConfig();
            _handleError(error);
            handler.next(error);
          },
        ),
      );
    }

    return _dio;
  }

  /// Loader Setup
  static bool loaderEnabled = true;

  // static get savedToken => null;
  static void showLoader() {
    if (loaderEnabled) EasyLoading.show();
  }

  static void hideLoader() {
    EasyLoading.dismiss();
  }

  static void enableLoader() {
    AppInterceptor.loaderEnabled = true;
  }

  static void disableLoader() {
    AppInterceptor.loaderEnabled = false;
  }

  /// ERROR HANDLER

  static void _handleError(DioException error) {
    Fluttertoast.showToast(
      msg: "${error.response?.data}",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.redLight,
      textColor: AppColors.white,
      fontSize: 16.0.sp,
    );
  }

  static void _reestablishDefaultConfig() {
    responseType = ResponseType.json;
  }

  static void onRequestSent(RequestOptions requestOptions) {
    if (kDebugMode) {
      log('✅✅✅✅✅✅✅✅✅✅✅✅ Request ✅✅✅✅✅✅✅✅✅✅✅✅✅');
      log('Method : ${requestOptions.method}');
      log('Path : ${requestOptions.baseUrl}${requestOptions.path}');
      if (requestOptions.method != 'GET') {
        log('Data : ${requestOptions.data}');
      }
      log('✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅');
    }
  }

  static void onResponseReceived(Response response) {
    if (kDebugMode) {
      if (response.statusCode == 200) {
        log('✅✅✅✅✅✅✅✅✅✅✅✅ Response success ✅✅✅✅✅✅✅✅✅✅✅✅✅');
        log('Status Code : ${response.statusCode}');
        log('Status Message : ${response.statusMessage}');
        log('Data : ${response.data}');
        log('✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅');
      } else {
        log('⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️ Response failed ⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️');
        log('Status Code : ${response.statusCode}');
        log('Status Message : ${response.statusMessage}');
        log('Data : ${response.data.toString()}');
        log('⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔⛔️⛔️⛔️⛔️⛔️⛔️⛔️');
      }
    }
  }

  static void onResponseFailed(DioException dioException) {
    if (kDebugMode) {
      log('⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️ Response error ⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️');
      log('Exception status code : ${dioException.response?.statusCode}');
      log('Exception status message : ${dioException.response?.statusMessage}');
      log('Exception type name : ${dioException.type.name}');
      log('Exception message : ${dioException.message}');
      log('Exception error : ${dioException.error.toString()}');

      log('⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️');
    }
  }
}
