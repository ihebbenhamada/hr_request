// To parse this JSON data, do
//
//     final createTicket = createTicketFromJson(jsonString);

import 'dart:convert';

GetCreateTicketResponse createTicketFromJson(String str) =>
    GetCreateTicketResponse.fromJson(json.decode(str));

String createTicketToJson(GetCreateTicketResponse data) =>
    json.encode(data.toJson());

class GetCreateTicketResponse {
  int? id;
  int? fKHrEmployeeId;
  String? employeeName;
  String? employeeBirthDate;

  bool? employeeTicket;
  bool? hasAirlineTicket;
  String? dueDate;

  bool? ticketForWife;
  String? wifeName;
  String? wifeBirthDate;

  bool? ticketForChild1;
  String? child1Name;
  String? child1BirthDate;

  bool? ticketForChild2;
  String? child2Name;
  String? child2BirthDate;

  GetCreateTicketResponse({
    required this.id,
    required this.fKHrEmployeeId,
    required this.employeeName,
    required this.employeeBirthDate,
    required this.employeeTicket,
    required this.hasAirlineTicket,
    required this.dueDate,
    required this.wifeName,
    required this.wifeBirthDate,
    required this.ticketForWife,
    required this.child1Name,
    required this.child1BirthDate,
    required this.ticketForChild1,
    required this.child2Name,
    required this.child2BirthDate,
    required this.ticketForChild2,
  });

  factory GetCreateTicketResponse.fromJson(Map<String, dynamic> json) =>
      GetCreateTicketResponse(
        id: json["id"],
        fKHrEmployeeId: json["fK_HrEmployeeId"],
        employeeName: json["employeeName"],
        employeeBirthDate: json["employeeBirthDate"],
        employeeTicket: json["employeeTicket"],
        hasAirlineTicket: json["hasAirlineTicket"],
        dueDate: json["dueDate"],
        wifeName: json["wifeName"],
        wifeBirthDate: json["wifeBirthDate"],
        ticketForWife: json["ticketForWife"],
        child1Name: json["child1Name"],
        child1BirthDate: json["child1BirthDate"],
        ticketForChild1: json["ticketForChild1"],
        child2Name: json["child2Name"],
        child2BirthDate: json["child2BirthDate"],
        ticketForChild2: json["ticketForChild2"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fK_HrEmployeeId": fKHrEmployeeId,
        "employeeName": employeeName,
        "employeeBirthDate": employeeBirthDate,
        "employeeTicket": employeeTicket,
        "hasAirlineTicket": hasAirlineTicket,
        "dueDate": dueDate,
        "wifeName": wifeName,
        "wifeBirthDate": wifeBirthDate,
        "ticketForWife": ticketForWife,
        "child1Name": child1Name,
        "child1BirthDate": child1BirthDate,
        "ticketForChild1": ticketForChild1,
        "child2Name": child2Name,
        "child2BirthDate": child2BirthDate,
        "ticketForChild2": ticketForChild2,
      };
}
