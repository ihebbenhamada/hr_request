// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  int id;
  String categoryCode;
  String categoryNameAr;
  String categoryNameEn;
  bool isDiscountable;
  bool isService;

  Category({
    required this.id,
    required this.categoryCode,
    required this.categoryNameAr,
    required this.categoryNameEn,
    required this.isDiscountable,
    required this.isService,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        categoryCode: json["categoryCode"],
        categoryNameAr: json["categoryNameAr"],
        categoryNameEn: json["categoryNameEn"],
        isDiscountable: json["isDiscountable"],
        isService: json["isService"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryCode": categoryCode,
        "categoryNameAr": categoryNameAr,
        "categoryNameEn": categoryNameEn,
        "isDiscountable": isDiscountable,
        "isService": isService,
      };
}
