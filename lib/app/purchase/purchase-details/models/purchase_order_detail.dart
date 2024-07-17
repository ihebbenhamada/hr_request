// To parse this JSON data, do
//
//     final purchaseOrderDetail = purchaseOrderDetailFromJson(jsonString);

import 'dart:convert';

List<PurchaseOrderDetail> purchaseOrderDetailFromJson(String str) =>
    List<PurchaseOrderDetail>.from(
        json.decode(str).map((x) => PurchaseOrderDetail.fromJson(x)));

String purchaseOrderDetailToJson(List<PurchaseOrderDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PurchaseOrderDetail {
  int fkStMainCategoryId;
  int fkStItemId;
  String itemName;
  String itemCode;
  int fkStUnitId;
  int quantity;
  String description;
  String newItemName;

  PurchaseOrderDetail({
    required this.fkStMainCategoryId,
    required this.fkStItemId,
    required this.itemName,
    required this.itemCode,
    required this.fkStUnitId,
    required this.quantity,
    required this.description,
    required this.newItemName,
  });

  factory PurchaseOrderDetail.fromJson(Map<String, dynamic> json) =>
      PurchaseOrderDetail(
        fkStMainCategoryId: json["fk_StMainCategoryId"],
        fkStItemId: json["fk_StItemId"],
        itemName: json["itemName"],
        itemCode: json["itemCode"],
        fkStUnitId: json["fk_StUnitId"],
        quantity: json["quantity"],
        description: json["description"],
        newItemName: json["newItemName"],
      );

  Map<String, dynamic> toJson() => {
        "fk_StMainCategoryId": fkStMainCategoryId,
        "fk_StItemId": fkStItemId,
        "itemName": itemName,
        "itemCode": itemCode,
        "fk_StUnitId": fkStUnitId,
        "quantity": quantity,
        "description": description,
        "newItemName": newItemName,
      };
}
