// To parse this JSON data, do
//
//     final ticketDetails = ticketDetailsFromJson(jsonString);

import 'dart:convert';

TicketDetails ticketDetailsFromJson(String str) =>
    TicketDetails.fromJson(json.decode(str));

String ticketDetailsToJson(TicketDetails data) => json.encode(data.toJson());

class TicketDetails {
  int id;
  int fKHrEmployeeId;
  String dueDate;
  String paymentType;
  bool employeeTicket;
  String? employeeNote;
  String? employeeName;
  String? employeeBirthDate;
  bool ticketForWife;
  String? wifeNote;
  String? wifeName;
  String? wifeBirthDate;
  bool ticketForChild1;
  String? child1Note;
  String? child1Name;
  String? child1BirthDate;
  bool ticketForChild2;
  String? child2Note;
  String? child2Name;
  String? child2BirthDate;
  String creationDate;
  String lastModifiedDate;
  String description;
  bool isActive;
  bool isDeleted;
  bool? hasAirlineTicket;
  int fKReqStatusId;
  String? status;
  String? imagePath;
  String employeeJob;
  int creatorJobTypeId;
  String hrEmployeeName;
  String paymentTypeName;
  String? managingDirectorSignature;
  int? managingDirectorLastActivity;
  String? hrManagerSignature;
  int? hrManagerLastActivity;
  int employeeType;
  List<Activity> activities;

  TicketDetails({
    required this.id,
    required this.fKHrEmployeeId,
    required this.dueDate,
    required this.paymentType,
    required this.employeeTicket,
    required this.employeeNote,
    required this.employeeName,
    required this.employeeBirthDate,
    required this.ticketForWife,
    required this.wifeNote,
    required this.wifeName,
    required this.wifeBirthDate,
    required this.ticketForChild1,
    required this.child1Note,
    required this.child1Name,
    required this.child1BirthDate,
    required this.ticketForChild2,
    required this.child2Note,
    required this.child2Name,
    required this.child2BirthDate,
    required this.creationDate,
    required this.lastModifiedDate,
    required this.description,
    required this.isActive,
    required this.isDeleted,
    required this.hasAirlineTicket,
    required this.fKReqStatusId,
    required this.status,
    required this.imagePath,
    required this.employeeJob,
    required this.creatorJobTypeId,
    required this.hrEmployeeName,
    required this.paymentTypeName,
    required this.managingDirectorSignature,
    required this.managingDirectorLastActivity,
    required this.hrManagerSignature,
    required this.hrManagerLastActivity,
    required this.employeeType,
    required this.activities,
  });

  factory TicketDetails.fromJson(Map<String, dynamic> json) => TicketDetails(
        id: json["id"],
        fKHrEmployeeId: json["fK_HrEmployeeId"],
        dueDate: json["dueDate"],
        paymentType: json["paymentType"],
        employeeTicket: json["employeeTicket"],
        employeeNote: json["employeeNote"],
        employeeName: json["employeeName"],
        employeeBirthDate: json["employeeBirthDate"],
        ticketForWife: json["ticketForWife"],
        wifeNote: json["wifeNote"],
        wifeName: json["wifeName"],
        wifeBirthDate: json["wifeBirthDate"],
        ticketForChild1: json["ticketForChild1"],
        child1Note: json["child1Note"],
        child1Name: json["child1Name"],
        child1BirthDate: json["child1BirthDate"],
        ticketForChild2: json["ticketForChild2"],
        child2Note: json["child2Note"],
        child2Name: json["child2Name"],
        child2BirthDate: json["child2BirthDate"],
        creationDate: json["creationDate"],
        lastModifiedDate: json["lastModifiedDate"],
        description: json["description"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        hasAirlineTicket: json["hasAirlineTicket"],
        fKReqStatusId: json["fK_ReqStatusId"],
        status: json["status"],
        imagePath: json["imagePath"],
        employeeJob: json["employeeJob"],
        creatorJobTypeId: json["creatorJobTypeId"],
        hrEmployeeName: json["hrEmployeeName"],
        paymentTypeName: json["paymentTypeName"],
        managingDirectorSignature: json["managingDirectorSignature"],
        managingDirectorLastActivity: json["managingDirectorLastActivity"],
        hrManagerSignature: json["hrManagerSignature"],
        hrManagerLastActivity: json["hrManagerLastActivity"],
        employeeType: json["employeeType"],
        activities: List<Activity>.from(
            json["activities"].map((x) => Activity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fK_HrEmployeeId": fKHrEmployeeId,
        "dueDate": dueDate,
        "paymentType": paymentType,
        "employeeTicket": employeeTicket,
        "employeeNote": employeeNote,
        "employeeName": employeeName,
        "employeeBirthDate": employeeBirthDate,
        "ticketForWife": ticketForWife,
        "wifeNote": wifeNote,
        "wifeName": wifeName,
        "wifeBirthDate": wifeBirthDate,
        "ticketForChild1": ticketForChild1,
        "child1Note": child1Note,
        "child1Name": child1Name,
        "child1BirthDate": child1BirthDate,
        "ticketForChild2": ticketForChild2,
        "child2Note": child2Note,
        "child2Name": child2Name,
        "child2BirthDate": child2BirthDate,
        "creationDate": creationDate,
        "lastModifiedDate": lastModifiedDate,
        "description": description,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "hasAirlineTicket": hasAirlineTicket,
        "fK_ReqStatusId": fKReqStatusId,
        "status": status,
        "imagePath": imagePath,
        "employeeJob": employeeJob,
        "creatorJobTypeId": creatorJobTypeId,
        "hrEmployeeName": hrEmployeeName,
        "paymentTypeName": paymentTypeName,
        "managingDirectorSignature": managingDirectorSignature,
        "managingDirectorLastActivity": managingDirectorLastActivity,
        "hrManagerSignature": hrManagerSignature,
        "hrManagerLastActivity": hrManagerLastActivity,
        "employeeType": employeeType,
        "activities": List<dynamic>.from(activities.map((x) => x.toJson())),
      };
}

class Activity {
  int id;
  int fKRequestTicketId;
  int fKReqStatusId;
  String? status;
  String? description;
  int fKCreatorId;
  int creatorJobType;
  String creationDate;
  String lastModifiedDate;
  bool isActive;
  bool isDeleted;
  String imagePath;
  String signaturePath;
  String creatorName;

  Activity({
    required this.id,
    required this.fKRequestTicketId,
    required this.fKReqStatusId,
    required this.status,
    this.description,
    required this.fKCreatorId,
    required this.creatorJobType,
    required this.creationDate,
    required this.lastModifiedDate,
    required this.isActive,
    required this.isDeleted,
    required this.imagePath,
    required this.signaturePath,
    required this.creatorName,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        fKRequestTicketId: json["fK_RequestTicketId"],
        fKReqStatusId: json["fK_ReqStatusId"],
        status: json["status"],
        description: json["description"] as String?,
        fKCreatorId: json["fK_CreatorId"],
        creatorJobType: json["creatorJobType"],
        creationDate: json["creationDate"],
        lastModifiedDate: json["lastModifiedDate"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        imagePath: json["imagePath"],
        signaturePath: json["signaturePath"],
        creatorName: json["creatorName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fK_RequestTicketId": fKRequestTicketId,
        "fK_ReqStatusId": fKReqStatusId,
        "status": status,
        "description": description,
        "fK_CreatorId": fKCreatorId,
        "creatorJobType": creatorJobType,
        "creationDate": creationDate,
        "lastModifiedDate": lastModifiedDate,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "imagePath": imagePath,
        "signaturePath": signaturePath,
        "creatorName": creatorName,
      };
}
