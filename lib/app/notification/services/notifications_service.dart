import 'package:dio/dio.dart';

import '../../../config/api-urls/end_points.dart';
import '../../../config/interceptor/interceptor.dart';
import '../model/notification.dart';

class NotificationsService {
  Future<List<Notification>?> getNotifications() async {
    Response? response =
        await AppInterceptor.dio?.get(EndPoints.GET_NOTIFICATIONS_URL);
    if (response != null && response.statusCode == 200) {
      List<Notification> notificationList = (response.data as List<dynamic>)
          .map((json) => Notification.fromJson(json))
          .toList();

      return notificationList;
    } else {
      return null;
    }
  }
}
