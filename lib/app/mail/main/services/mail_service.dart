import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:request_hr/app/mail/main/model/mail.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';

class MailService {
  Future<List<Mail>?> getMailList() async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_ALL_MESSAGES_URL(null));
      if (response != null && response.statusCode == 200) {
        List<Mail> mailResponseList = (response.data as List<dynamic>)
            .map((json) => Mail.fromJson(json))
            .toList();
        return mailResponseList;
      } else {
        return null;
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        msg: "Error!",
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
