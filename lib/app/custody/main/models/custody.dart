// To parse this JSON data, do
//
//     final custody = custodyFromJson(jsonString);

import 'dart:convert';

List<Custody> custodyFromJson(String str) =>
    List<Custody>.from(json.decode(str).map((x) => Custody.fromJson(x)));

String custodyToJson(List<Custody> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Custody {
  int custodyId;
  int fkHrEmployeeId;
  int paymentType;
  String dateCustody;
  int totalAmount;
  int fkCbCustodyTypeId;
  String custodyName;
  String subject;
  String description;
  int fkReqStatusId;

  Custody({
    required this.custodyId,
    required this.fkHrEmployeeId,
    required this.paymentType,
    required this.dateCustody,
    required this.totalAmount,
    required this.fkCbCustodyTypeId,
    required this.custodyName,
    required this.subject,
    required this.description,
    required this.fkReqStatusId,
  });

  factory Custody.fromJson(Map<String, dynamic> json) => Custody(
        custodyId: json["CustodyId"],
        fkHrEmployeeId: json["FK_HrEmployeeId"],
        paymentType: json["PaymentType"],
        dateCustody: json["DateCustody "],
        totalAmount: json["TotalAmount"],
        fkCbCustodyTypeId: json["FK_CbCustodyTypeId"],
        custodyName: json["CustodyName"],
        subject: json["Subject"],
        description: json["Description"],
        fkReqStatusId: json["FK_ReqStatusId"],
      );

  Map<String, dynamic> toJson() => {
        "CustodyId": custodyId,
        "FK_HrEmployeeId": fkHrEmployeeId,
        "PaymentType": paymentType,
        "DateCustody ": dateCustody,
        "TotalAmount": totalAmount,
        "FK_CbCustodyTypeId": fkCbCustodyTypeId,
        "CustodyName": custodyName,
        "Subject": subject,
        "Description": description,
        "FK_ReqStatusId": fkReqStatusId,
      };
}
