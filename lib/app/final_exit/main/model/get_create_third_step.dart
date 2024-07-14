// To parse this JSON data, do
//
//     final getCreateThirdStep = getCreateThirdStepFromJson(jsonString);

import 'dart:convert';

import 'package:request_hr/app/dashboard/tabs/vacations/main/models/drop_down.dart';

GetCreateThirdStep getCreateThirdStepFromJson(String str) =>
    GetCreateThirdStep.fromJson(json.decode(str));

String getCreateThirdStepToJson(GetCreateThirdStep data) =>
    json.encode(data.toJson());

class GetCreateThirdStep {
  int id;
  int fKHrEmployeeId;
  String employeeName;
  String departmentName;
  String? jobName;
  String? reason;
  String lastWorkingDayDate;
  int? fKReqFinalExitId;
  int? fKRequestVacationId;
  bool? isFinalHandOver;
  String? fileName;
  String? handOverCommitmentFilePath;
  int fKHrCreatorId;
  String creationDate;
  String lastModifiedDate;
  bool isActive;
  bool isDeleted;
  String? reviewer;
  DefBranchVm? defBranchVm;
  GetCreateThirdStep({
    required this.id,
    required this.fKHrEmployeeId,
    required this.employeeName,
    required this.departmentName,
    required this.jobName,
    required this.reason,
    required this.lastWorkingDayDate,
    required this.fKReqFinalExitId,
    required this.fKRequestVacationId,
    required this.isFinalHandOver,
    required this.fileName,
    required this.handOverCommitmentFilePath,
    required this.fKHrCreatorId,
    required this.creationDate,
    required this.lastModifiedDate,
    required this.isActive,
    required this.isDeleted,
    required this.reviewer,
    this.defBranchVm,
  });

  factory GetCreateThirdStep.fromJson(Map<String, dynamic> json) =>
      GetCreateThirdStep(
        id: json["id"],
        fKHrEmployeeId: json["fK_HrEmployeeId"],
        employeeName: json["employeeName"],
        departmentName: json["departmentName"],
        jobName: json["jobName"],
        reason: json["reason"],
        lastWorkingDayDate: json["lastWorkingDayDate"],
        fKReqFinalExitId: json["fK_ReqFinalExitId"],
        fKRequestVacationId: json["fK_RequestVacationId"],
        isFinalHandOver: json["isFinalHandOver"],
        fileName: json["fileName"],
        handOverCommitmentFilePath: json["handOverCommitmentFilePath"],
        fKHrCreatorId: json["fK_HrCreatorId"],
        creationDate: json["creationDate"],
        lastModifiedDate: json["lastModifiedDate"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        reviewer: json["reviewer"],
        defBranchVm: json["defBranchVM"] != null
            ? DefBranchVm.fromJson(json["defBranchVM"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fK_HrEmployeeId": fKHrEmployeeId,
        "employeeName": employeeName,
        "departmentName": departmentName,
        "jobName": jobName,
        "reason": reason,
        "lastWorkingDayDate": lastWorkingDayDate,
        "fK_ReqFinalExitId": fKReqFinalExitId,
        "fK_RequestVacationId": fKRequestVacationId,
        "isFinalHandOver": isFinalHandOver,
        "fileName": fileName,
        "handOverCommitmentFilePath": handOverCommitmentFilePath,
        "fK_HrCreatorId": fKHrCreatorId,
        "creationDate": creationDate,
        "lastModifiedDate": lastModifiedDate,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "reviewer": reviewer,
        "defBranchVM": defBranchVm?.toJson(),
      };
}

class DefBranchVm {
  int id;
  String branchCode;
  String branchSymbol;
  String fkDefCompanyId;
  String branchNameAr;
  String branchNameEn;
  String branchAddress;
  String phone1;
  String phone2;
  String phone3;
  String email;
  String fax;
  String fax2;
  String fax3;
  String postCode;
  String notes;
  String logoUrl;
  int? fkCreatorId;
  int? fkDefCountryId;
  int? fkDefCityId;
  String creationDate;
  bool isActive;
  bool isDeleted;
  String lastModifiedDate;
  List<DropDownModel> companiesList;
  List<DropDownModel> countries;
  List<DropDownModel> cities;
  String branchImage;
  String website;
  String taxCard;
  String commercialRegister;
  String freezingNote;
  int? fkDefFreezingReasonId;
  String headerText;
  String headerUrl;
  String footerText;
  String footerUrl;
  int? fkModifiedById;
  String codeAndName;
  String headerImage;
  String footerImage;
  List<DropDownModel> freezingReason;

  DefBranchVm({
    required this.id,
    required this.branchCode,
    required this.branchSymbol,
    required this.fkDefCompanyId,
    required this.branchNameAr,
    required this.branchNameEn,
    required this.branchAddress,
    required this.phone1,
    required this.phone2,
    required this.phone3,
    required this.email,
    required this.fax,
    required this.fax2,
    required this.fax3,
    required this.postCode,
    required this.notes,
    required this.logoUrl,
    required this.fkCreatorId,
    required this.fkDefCountryId,
    required this.fkDefCityId,
    required this.creationDate,
    required this.isActive,
    required this.isDeleted,
    required this.lastModifiedDate,
    required this.companiesList,
    required this.countries,
    required this.cities,
    required this.branchImage,
    required this.website,
    required this.taxCard,
    required this.commercialRegister,
    required this.freezingNote,
    required this.fkDefFreezingReasonId,
    required this.headerText,
    required this.headerUrl,
    required this.footerText,
    required this.footerUrl,
    required this.fkModifiedById,
    required this.codeAndName,
    required this.headerImage,
    required this.footerImage,
    required this.freezingReason,
  });

  factory DefBranchVm.fromJson(Map<String, dynamic> json) => DefBranchVm(
        id: json["Id"],
        branchCode: json["BranchCode"],
        branchSymbol: json["BranchSymbol"],
        fkDefCompanyId: json["FK_DefCompanyId"],
        branchNameAr: json["BranchNameAr"],
        branchNameEn: json["BranchNameEn"],
        branchAddress: json["BranchAddress"],
        phone1: json["Phone1"],
        phone2: json["Phone2"],
        phone3: json["Phone3"],
        email: json["Email"],
        fax: json["Fax"],
        fax2: json["Fax2"],
        fax3: json["Fax3"],
        postCode: json["PostCode"],
        notes: json["Notes"],
        logoUrl: json["LogoUrl"],
        fkCreatorId: json["FK_CreatorId"],
        fkDefCountryId: json["FK_DefCountryId"],
        fkDefCityId: json["FK_DefCityId"],
        creationDate: json["CreationDate"],
        isActive: json["IsActive"],
        isDeleted: json["IsDeleted"],
        lastModifiedDate: json["LastModifiedDate"],
        companiesList: List<DropDownModel>.from(
            json["CompaniesList"].map((x) => DropDownModel.fromJson(x))),
        countries: List<DropDownModel>.from(
            json["Countries"].map((x) => DropDownModel.fromJson(x))),
        cities: List<DropDownModel>.from(
            json["Cities"].map((x) => DropDownModel.fromJson(x))),
        branchImage: json["BranchImage"],
        website: json["Website"],
        taxCard: json["TaxCard"],
        commercialRegister: json["CommercialRegister"],
        freezingNote: json["FreezingNote"],
        fkDefFreezingReasonId: json["FK_DefFreezingReasonId"],
        headerText: json["HeaderText"],
        headerUrl: json["HeaderUrl"],
        footerText: json["FooterText"],
        footerUrl: json["FooterUrl"],
        fkModifiedById: json["FK_ModifiedById"],
        codeAndName: json["CodeAndName"],
        headerImage: json["HeaderImage"],
        footerImage: json["FooterImage"],
        freezingReason: List<DropDownModel>.from(
            json["FreezingReason"].map((x) => DropDownModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "BranchCode": branchCode,
        "BranchSymbol": branchSymbol,
        "FK_DefCompanyId": fkDefCompanyId,
        "BranchNameAr": branchNameAr,
        "BranchNameEn": branchNameEn,
        "BranchAddress": branchAddress,
        "Phone1": phone1,
        "Phone2": phone2,
        "Phone3": phone3,
        "Email": email,
        "Fax": fax,
        "Fax2": fax2,
        "Fax3": fax3,
        "PostCode": postCode,
        "Notes": notes,
        "LogoUrl": logoUrl,
        "FK_CreatorId": fkCreatorId,
        "FK_DefCountryId": fkDefCountryId,
        "FK_DefCityId": fkDefCityId,
        "CreationDate": creationDate,
        "IsActive": isActive,
        "IsDeleted": isDeleted,
        "LastModifiedDate": lastModifiedDate,
        "CompaniesList":
            List<dynamic>.from(companiesList.map((x) => x.toJson())),
        "Countries": List<dynamic>.from(countries.map((x) => x.toJson())),
        "Cities": List<dynamic>.from(cities.map((x) => x.toJson())),
        "BranchImage": branchImage,
        "Website": website,
        "TaxCard": taxCard,
        "CommercialRegister": commercialRegister,
        "FreezingNote": freezingNote,
        "FK_DefFreezingReasonId": fkDefFreezingReasonId,
        "HeaderText": headerText,
        "HeaderUrl": headerUrl,
        "FooterText": footerText,
        "FooterUrl": footerUrl,
        "FK_ModifiedById": fkModifiedById,
        "CodeAndName": codeAndName,
        "HeaderImage": headerImage,
        "FooterImage": footerImage,
        "FreezingReason":
            List<dynamic>.from(freezingReason.map((x) => x.toJson())),
      };
}
