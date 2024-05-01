// To parse this JSON data, do
//
//     final signinOutCreate = signinOutCreateFromJson(jsonString);

import 'dart:convert';

SigninOutCreate signinOutCreateFromJson(String str) =>
    SigninOutCreate.fromJson(json.decode(str));

String signinOutCreateToJson(SigninOutCreate data) =>
    json.encode(data.toJson());

class SigninOutCreate {
  int id;
  int fKHrEmployeeId;
  DateTime signDate;
  String signTime;
  dynamic attendType;
  dynamic location;
  dynamic areaName;
  bool isDeleted;
  List<InOut> listInOut;
  dynamic resultMessage;
  dynamic resultStatus;

  SigninOutCreate({
    required this.id,
    required this.fKHrEmployeeId,
    required this.signDate,
    required this.signTime,
    required this.attendType,
    required this.location,
    required this.areaName,
    required this.isDeleted,
    required this.listInOut,
    required this.resultMessage,
    required this.resultStatus,
  });

  factory SigninOutCreate.fromJson(Map<String, dynamic> json) =>
      SigninOutCreate(
        id: json["id"],
        fKHrEmployeeId: json["fK_HrEmployeeId"],
        signDate: DateTime.parse(json["signDate"]),
        signTime: json["signTime"],
        attendType: json["attendType"],
        location: json["location"],
        areaName: json["areaName"],
        isDeleted: json["isDeleted"],
        listInOut:
            List<InOut>.from(json["listInOut"].map((x) => InOut.fromJson(x))),
        resultMessage: json["resultMessage"],
        resultStatus: json["resultStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fK_HrEmployeeId": fKHrEmployeeId,
        "signDate": signDate.toIso8601String(),
        "signTime": signTime,
        "attendType": attendType,
        "location": location,
        "areaName": areaName,
        "isDeleted": isDeleted,
        "listInOut": List<InOut>.from(listInOut.map((x) => x.toJson())),
        "resultMessage": resultMessage,
        "resultStatus": resultStatus,
      };
}

class InOut {
  int id;
  int fKHrEmployeeId;
  String employeeName;
  String signDate;
  String signTime;
  String attendType;
  String location;
  String areaName;
  bool isDeleted;
  String emloyeeImg;

  InOut({
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

  factory InOut.fromJson(Map<String, dynamic> json) => InOut(
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
