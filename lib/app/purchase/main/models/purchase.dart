// To parse this JSON data, do
//
//     final purchase = purchaseFromJson(jsonString);

import 'dart:convert';

Purchase purchaseFromJson(String str) => Purchase.fromJson(json.decode(str));

String purchaseToJson(Purchase data) => json.encode(data.toJson());

class Purchase {
  int id;
  String serialPrefix;
  int serialNumber;
  String orderDate;
  int fkStStatusId;
  String status;
  String description;

  Purchase({
    required this.id,
    required this.serialPrefix,
    required this.serialNumber,
    required this.orderDate,
    required this.fkStStatusId,
    required this.status,
    required this.description,
  });

  factory Purchase.fromJson(Map<String, dynamic> json) => Purchase(
        id: json["id"],
        serialPrefix: json["serialPrefix "],
        serialNumber: json["serialNumber "],
        orderDate: json["orderDate "],
        fkStStatusId: json["fk_StStatusId "],
        status: json["status "],
        description: json["description "],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "serialPrefix ": serialPrefix,
        "serialNumber ": serialNumber,
        "orderDate ": orderDate,
        "fk_StStatusId ": fkStStatusId,
        "status ": status,
        "description ": description,
      };
}
