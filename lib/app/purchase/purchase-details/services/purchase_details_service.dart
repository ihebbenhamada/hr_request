import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as get_tr;
import 'package:request_hr/config/api-urls/end_points.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../../config/interceptor/interceptor.dart';
import '../models/category.dart';
import '../models/product.dart';

class PurchaseDetailsService {
  Future<List<Category>?> getCategories({String lang = "en"}) async {
    try {
      Response? response = await AppInterceptor.dio
          ?.get(EndPoints.GET_ALL_PURCHASE_CATEGORIES_URL + lang);
      if (response != null && response.statusCode == 200) {
        List<Category> categoryResponseList = (response.data as List<dynamic>)
            .map((json) => Category.fromJson(json))
            .toList();

        return categoryResponseList;
      } else {
        return null;
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        msg: "error".tr,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.redLight,
        textColor: AppColors.white,
        fontSize: 16.0.sp,
      );
      return null;
    }
  }

  Future<List<Product>?> getProductsByCategoryId(
      {required String id, String lang = "en"}) async {
    try {
      Response? response = await AppInterceptor.dio?.get(EndPoints
          .GET_ALL_ST_PRODUCTS_FOR_DDLIST_WITH_IMAGES_BY_CATEGORY_ID_URL(
              id, lang));
      if (response != null && response.statusCode == 200) {
        List<Product> productResponseList = (response.data as List<dynamic>)
            .map((json) => Product.fromJson(json))
            .toList();
        return productResponseList;
      } else {
        return null;
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        msg: "error".tr,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.redLight,
        textColor: AppColors.white,
        fontSize: 16.0.sp,
      );
      return null;
    }
  }
}
