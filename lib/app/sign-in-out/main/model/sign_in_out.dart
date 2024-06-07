// To parse this JSON data, do
//
//     final signInOut = signInOutFromJson(jsonString);

import 'dart:convert';

List<SignInOut> signInOutFromJson(String str) =>
    List<SignInOut>.from(json.decode(str).map((x) => SignInOut.fromJson(x)));

String signInOutToJson(List<SignInOut> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SignInOut {
  int id;
  int fKHrEmployeeId;
  String employeeName;
  String signDate;
  String signTime;
  String? attendType;
  String? location;
  String areaName;
  bool isDeleted;
  String emloyeeImg;

  SignInOut({
    required this.id,
    required this.fKHrEmployeeId,
    required this.employeeName,
    required this.signDate,
    required this.signTime,
    required this.attendType,
    required this.location,
    required this.areaName,
    required this.isDeleted,
    required this.emloyeeImg,
  });

  factory SignInOut.fromJson(Map<String, dynamic> json) => SignInOut(
        id: json["id"],
        fKHrEmployeeId: json["fK_HrEmployeeId"],
        employeeName: json["employeeName"],
        signDate: json["signDate"],
        signTime: json["signTime"],
        attendType: json["attendType"],
        location: json["location"],
        areaName: json["areaName"],
        isDeleted: json["isDeleted"],
        emloyeeImg: json["emloyeeImg"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fK_HrEmployeeId": fKHrEmployeeId,
        "employeeName": employeeName,
        "signDate": signDate,
        "signTime": signTime,
        "attendType": attendType,
        "location": location,
        "areaName": areaName,
        "isDeleted": isDeleted,
        "emloyeeImg": emloyeeImg,
      };
}
