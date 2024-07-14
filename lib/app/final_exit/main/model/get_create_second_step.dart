// To parse this JSON data, do
//
//     final getCreateSecondStep = getCreateSecondStepFromJson(jsonString);

import 'dart:convert';

import 'package:request_hr/app/dashboard/tabs/vacations/main/models/drop_down.dart';

GetCreateSecondStep getCreateSecondStepFromJson(String str) =>
    GetCreateSecondStep.fromJson(json.decode(str));

String getCreateSecondStepToJson(GetCreateSecondStep data) =>
    json.encode(data.toJson());

class GetCreateSecondStep {
  int id;
  int fKHrEmployeeId;
  String dateDue;
  double totalDeservedAmount;
  double? totalExtaraTicketsValue;
  String? ticketPath;
  String? description;
  bool isFromRequests;
  int? requestRefrenceId;
  int fKCreatorId;
  String creationDate;
  String lastModifiedDate;
  bool isActive;
  bool isDeleted;
  String? imagePath;
  String? employeeName;
  int? fKDefBranchId;
  int? fKHrManagementId;
  int? fKHrDepartmentId;
  String? employeeCode;
  List<DropDownModel> hrDepartments;
  List<DropDownModel> hrManagements;
  List<DropDownModel> defBranches;
  List<DropDownModel> kinshipType;
  int? paymentTypes;
  List<DropDownModel> paymentType;
  List<Detail> details;

  GetCreateSecondStep({
    required this.id,
    required this.fKHrEmployeeId,
    required this.dateDue,
    required this.totalDeservedAmount,
    required this.totalExtaraTicketsValue,
    required this.ticketPath,
    required this.description,
    required this.isFromRequests,
    required this.requestRefrenceId,
    required this.fKCreatorId,
    required this.creationDate,
    required this.lastModifiedDate,
    required this.isActive,
    required this.isDeleted,
    required this.imagePath,
    required this.employeeName,
    required this.fKDefBranchId,
    required this.fKHrManagementId,
    required this.fKHrDepartmentId,
    required this.employeeCode,
    required this.hrDepartments,
    required this.hrManagements,
    required this.defBranches,
    required this.kinshipType,
    required this.paymentTypes,
    required this.paymentType,
    required this.details,
  });

  factory GetCreateSecondStep.fromJson(Map<String, dynamic> json) =>
      GetCreateSecondStep(
        id: json["id"],
        fKHrEmployeeId: json["fK_HrEmployeeId"],
        dateDue: json["dateDue"],
        totalDeservedAmount:
            double.parse(json["totalDeservedAmount"].toString()),
        totalExtaraTicketsValue: json["totalExtaraTicketsValue"],
        ticketPath: json["ticketPath"],
        description: json["description"],
        isFromRequests: json["isFromRequests"],
        requestRefrenceId: json["requestRefrenceId"],
        fKCreatorId: json["fK_CreatorId"],
        creationDate: json["creationDate"],
        lastModifiedDate: json["lastModifiedDate"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        imagePath: json["imagePath"],
        employeeName: json["employeeName"],
        fKDefBranchId: json["fK_DefBranchId"],
        fKHrManagementId: json["fK_HrManagementId"],
        fKHrDepartmentId: json["fK_HrDepartmentId"],
        employeeCode: json["employeeCode"],
        hrDepartments: List<DropDownModel>.from(
            json["hrDepartments"].map((x) => DropDownModel.fromJson(x))),
        hrManagements: List<DropDownModel>.from(
            json["hrManagements"].map((x) => DropDownModel.fromJson(x))),
        defBranches: List<DropDownModel>.from(
            json["defBranches"].map((x) => DropDownModel.fromJson(x))),
        kinshipType: List<DropDownModel>.from(
            json["kinshipType"].map((x) => DropDownModel.fromJson(x))),
        paymentTypes: json["paymentTypes"],
        paymentType: List<DropDownModel>.from(
            json["paymentType"].map((x) => DropDownModel.fromJson(x))),
        details:
            List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fK_HrEmployeeId": fKHrEmployeeId,
        "dateDue": dateDue,
        "totalDeservedAmount": totalDeservedAmount,
        "totalExtaraTicketsValue": totalExtaraTicketsValue,
        "ticketPath": ticketPath,
        "description": description,
        "isFromRequests": isFromRequests,
        "requestRefrenceId": requestRefrenceId,
        "fK_CreatorId": fKCreatorId,
        "creationDate": creationDate,
        "lastModifiedDate": lastModifiedDate,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "imagePath": imagePath,
        "employeeName": employeeName,
        "fK_DefBranchId": fKDefBranchId,
        "fK_HrManagementId": fKHrManagementId,
        "fK_HrDepartmentId": fKHrDepartmentId,
        "employeeCode": employeeCode,
        "hrDepartments": List<dynamic>.from(hrDepartments.map((x) => x)),
        "hrManagements": List<dynamic>.from(hrManagements.map((x) => x)),
        "defBranches": List<dynamic>.from(defBranches.map((x) => x)),
        "kinshipType": List<dynamic>.from(kinshipType.map((x) => x)),
        "paymentTypes": paymentTypes,
        "paymentType": List<dynamic>.from(paymentType.map((x) => x)),
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
      };
}

class Detail {
  int id;
  int fkHrEmployeeTicketId;
  String name;
  String dateOfBirth;
  int fkHrkinshipTypeId;
  String kinshipTypeName;
  bool isDeserve;
  int paymentType;
  double amount;
  int fkCreatorId;
  String dateOfTravel;
  String creationDate;
  String lastModifiedDate;
  bool isActive;
  bool isDeleted;
  bool isFromRequests;
  String description;
  int fkHrEmployeekinshipId;
  int ticketType;

  Detail({
    required this.id,
    required this.fkHrEmployeeTicketId,
    required this.name,
    required this.dateOfBirth,
    required this.fkHrkinshipTypeId,
    required this.kinshipTypeName,
    required this.isDeserve,
    required this.paymentType,
    required this.amount,
    required this.fkCreatorId,
    required this.dateOfTravel,
    required this.creationDate,
    required this.lastModifiedDate,
    required this.isActive,
    required this.isDeleted,
    required this.isFromRequests,
    required this.description,
    required this.fkHrEmployeekinshipId,
    required this.ticketType,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["Id"],
        fkHrEmployeeTicketId: json["FK_HrEmployeeTicketId"],
        name: json["Name"],
        dateOfBirth: json["DateOfBirth"],
        fkHrkinshipTypeId: json["FK_HrkinshipTypeId"],
        kinshipTypeName: json["kinshipTypeName"],
        isDeserve: json["IsDeserve"],
        paymentType: json["PaymentType"],
        amount: json["Amount"]?.toDouble(),
        fkCreatorId: json["FK_CreatorId"],
        dateOfTravel: json["DateOfTravel"],
        creationDate: json["CreationDate"],
        lastModifiedDate: json["LastModifiedDate"],
        isActive: json["IsActive"],
        isDeleted: json["IsDeleted"],
        isFromRequests: json["IsFromRequests"],
        description: json["Description"],
        fkHrEmployeekinshipId: json["FK_HrEmployeekinshipId"],
        ticketType: json["TicketType"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "FK_HrEmployeeTicketId": fkHrEmployeeTicketId,
        "Name": name,
        "DateOfBirth": dateOfBirth,
        "FK_HrkinshipTypeId": fkHrkinshipTypeId,
        "kinshipTypeName": kinshipTypeName,
        "IsDeserve": isDeserve,
        "PaymentType": paymentType,
        "Amount": amount,
        "FK_CreatorId": fkCreatorId,
        "DateOfTravel": dateOfTravel,
        "CreationDate": creationDate,
        "LastModifiedDate": lastModifiedDate,
        "IsActive": isActive,
        "IsDeleted": isDeleted,
        "IsFromRequests": isFromRequests,
        "Description": description,
        "FK_HrEmployeekinshipId": fkHrEmployeekinshipId,
        "TicketType": ticketType,
      };
}
