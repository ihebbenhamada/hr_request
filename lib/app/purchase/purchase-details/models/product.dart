// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  int id;
  String productCode;
  String productName;
  String productNameEn;
  bool codeAndName;
  String imagePath;
  int fkStMainCategoryId;
  int fkStCategoryId;
  int fkStBrandId;
  int fkStUnitId;
  int fkTaxesId;
  int fkStManufacturingCountryId;
  int fkStManufacturerId;
  int fkStItemLocationId;
  int orderLimit;
  String description;

  Product({
    required this.id,
    required this.productCode,
    required this.productName,
    required this.productNameEn,
    required this.codeAndName,
    required this.imagePath,
    required this.fkStMainCategoryId,
    required this.fkStCategoryId,
    required this.fkStBrandId,
    required this.fkStUnitId,
    required this.fkTaxesId,
    required this.fkStManufacturingCountryId,
    required this.fkStManufacturerId,
    required this.fkStItemLocationId,
    required this.orderLimit,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productCode: json["productCode"],
        productName: json["productName"],
        productNameEn: json["productNameEn"],
        codeAndName: json["codeAndName"],
        imagePath: json["imagePath"],
        fkStMainCategoryId: json["fk_StMainCategoryId"],
        fkStCategoryId: json["fk_StCategoryId"],
        fkStBrandId: json["fk_StBrandId"],
        fkStUnitId: json["fk_StUnitId"],
        fkTaxesId: json["fk_TaxesId"],
        fkStManufacturingCountryId: json["fk_StManufacturingCountryId"],
        fkStManufacturerId: json["fk_StManufacturerId"],
        fkStItemLocationId: json["fk_StItemLocationId"],
        orderLimit: json["orderLimit"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productCode": productCode,
        "productName": productName,
        "productNameEn": productNameEn,
        "codeAndName": codeAndName,
        "imagePath": imagePath,
        "fk_StMainCategoryId": fkStMainCategoryId,
        "fk_StCategoryId": fkStCategoryId,
        "fk_StBrandId": fkStBrandId,
        "fk_StUnitId": fkStUnitId,
        "fk_TaxesId": fkTaxesId,
        "fk_StManufacturingCountryId": fkStManufacturingCountryId,
        "fk_StManufacturerId": fkStManufacturerId,
        "fk_StItemLocationId": fkStItemLocationId,
        "orderLimit": orderLimit,
        "description": description,
      };
}
