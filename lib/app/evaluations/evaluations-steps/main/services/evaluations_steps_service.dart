import 'package:dio/dio.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/drop_down.dart';

import '../../../../../config/api-urls/end_points.dart';
import '../../../../../config/interceptor/interceptor.dart';
import '../../../main/models/evaluation_form.dart';

class EvaluationsStepsService {
  Future<List<DropDownModel>?> getFormTypes() async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_EVALUATION_FORM_TYPE_URL);
      if (response != null && response.statusCode == 200) {
        List<DropDownModel> list = (response.data as List<dynamic>)
            .map((json) => DropDownModel.fromJson(json))
            .toList();

        return list;
      } else {
        return null;
      }
    } on DioException catch (e) {
      return null;
    }
  }

  Future<EvaluationForm?> getFormData(String fileId) async {
    try {
      Response? response = await AppInterceptor.dio
          ?.get(EndPoints.GET_CREATE_EVALUATION_URL(fileId));
      if (response != null && response.statusCode == 200) {
        return EvaluationForm.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      return null;
    }
  }
}
