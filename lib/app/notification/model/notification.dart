// To parse this JSON data, do
//
//     final notification = notificationFromJson(jsonString);

import 'dart:convert';

List<Notification> notificationFromJson(String str) => List<Notification>.from(
    json.decode(str).map((x) => Notification.fromJson(x)));

String notificationToJson(List<Notification> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notification {
  int id;
  String notificationText;
  int requestType;
  int fKRefrecnceId;
  String? refrecnceLink;
  bool showApprovalButton;
  int fKCreatorId;
  String creatorName;
  String creationDate;
  String creationDateString;
  bool isRead;
  int notificationCount;

  Notification({
    required this.id,
    required this.notificationText,
    required this.requestType,
    required this.fKRefrecnceId,
    required this.refrecnceLink,
    required this.showApprovalButton,
    required this.fKCreatorId,
    required this.creatorName,
    required this.creationDate,
    required this.creationDateString,
    required this.isRead,
    required this.notificationCount,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"],
        notificationText: json["notificationText"],
        requestType: json["requestType"],
        fKRefrecnceId: json["fK_RefrecnceId"],
        refrecnceLink: json["refrecnceLink"],
        showApprovalButton: json["showApprovalButton"],
        fKCreatorId: json["fK_CreatorId"],
        creatorName: json["creatorName"],
        creationDate: json["creationDate"],
        creationDateString: json["creationDateString"],
        isRead: json["isRead"],
        notificationCount: json["notificationCount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "notificationText": notificationText,
        "requestType": requestType,
        "fK_RefrecnceId": fKRefrecnceId,
        "refrecnceLink": refrecnceLink,
        "showApprovalButton": showApprovalButton,
        "fK_CreatorId": fKCreatorId,
        "creatorName": creatorName,
        "creationDate": creationDate,
        "creationDateString": creationDateString,
        "isRead": isRead,
        "notificationCount": notificationCount,
      };
}
