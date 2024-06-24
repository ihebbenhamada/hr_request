// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String resultMessage;
  String userName;
  bool isAuthenticated;
  String email;
  String phoneNumber;
  String token;
  bool isAdmin;
  String refreshTokenExpiration;
  User user;
  Emp employee;
  List<UserRole> userRoles;

  LoginResponse({
    required this.resultMessage,
    required this.userName,
    required this.isAuthenticated,
    required this.email,
    required this.phoneNumber,
    required this.token,
    required this.isAdmin,
    required this.refreshTokenExpiration,
    required this.user,
    required this.employee,
    required this.userRoles,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        resultMessage: json["resultMessage"],
        userName: json["userName"],
        isAuthenticated: json["isAuthenticated"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        token: json["token"],
        isAdmin: json["isAdmin"],
        refreshTokenExpiration: json["refreshTokenExpiration"],
        user: User.fromJson(json["user"]),
        employee: Emp.fromJson(json["employee"]),
        userRoles: (json["userRoles"] as List<dynamic>)
            .map((json) => UserRole.fromJson(json))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "resultMessage": resultMessage,
        "userName": userName,
        "isAuthenticated": isAuthenticated,
        "email": email,
        "phoneNumber": phoneNumber,
        "token": token,
        "isAdmin": isAdmin,
        "refreshTokenExpiration": refreshTokenExpiration,
        "user": user.toJson(),
        "employee": employee.toJson(),
        "userRoles": userRoles.map((map) => map.toJson()),
      };
}

class Emp {
  int id;
  String code;
  String fullName;
  String fullNameEn;
  String idNumber;
  int fKDefBranchId;
  int? fKHrSubBranchId;
  int fKHrManagementId;
  int fKHrDepartmentId;
  String? imagePath;
  String birthDate;
  int fKHrBloodTypeId;
  int gender;
  String placeOfBirth;
  int fKNationalityId;
  int fKDefReligionId;
  int fKSocialStatusId;
  bool hasAirlineTicket;
  int? fKHrTicketTypeId;
  int? ticketCount;
  String? dateEntitlement;
  String? contractDueDate;
  String branchName;
  String? contractStartDate;
  int fKGeneralManagerId;
  int? fKManagingDirectorId;
  int? fKHumanResourcesManagerId;
  int? fKDepartmentManagerId;
  int? fKDirectorGeneralId;
  int? fKHrJobTypeId;
  String jobName;
  String? nationalityName;
  String? mobile;
  String? dateOfIssued;
  String issuerName;
  String? signaturePath;
  int? fKManagementId;
  bool isActive;
  String? branchNameEn;
  String? codeAndName;
  String? departmentName;
  String creationDate;
  String? nameAndCode;
  String? email;
  String? surName;
  int? salary;
  bool isDeleted;
  bool isDeveloper;
  int fKCostcenterId;
  String? creatorName;
  int fKCreatorId;
  int fKModifiedById;
  String lastModifiedDate;

  Emp({
    required this.id,
    required this.code,
    required this.fullName,
    required this.fullNameEn,
    required this.idNumber,
    required this.fKDefBranchId,
    this.fKHrSubBranchId,
    required this.fKHrManagementId,
    required this.fKHrDepartmentId,
    this.imagePath,
    required this.birthDate,
    required this.fKHrBloodTypeId,
    required this.gender,
    required this.placeOfBirth,
    required this.fKNationalityId,
    required this.fKDefReligionId,
    required this.fKSocialStatusId,
    required this.hasAirlineTicket,
    this.fKHrTicketTypeId,
    this.ticketCount,
    this.dateEntitlement,
    required this.contractDueDate,
    required this.branchName,
    required this.contractStartDate,
    required this.fKGeneralManagerId,
    required this.fKManagingDirectorId,
    required this.fKHumanResourcesManagerId,
    required this.fKDepartmentManagerId,
    required this.fKDirectorGeneralId,
    this.fKHrJobTypeId,
    required this.jobName,
    this.nationalityName,
    this.mobile,
    this.dateOfIssued,
    required this.issuerName,
    this.signaturePath,
    this.fKManagementId,
    required this.isActive,
    this.branchNameEn,
    this.codeAndName,
    this.departmentName,
    required this.creationDate,
    this.nameAndCode,
    this.email,
    this.surName,
    this.salary,
    required this.isDeleted,
    required this.isDeveloper,
    required this.fKCostcenterId,
    this.creatorName,
    required this.fKCreatorId,
    required this.fKModifiedById,
    required this.lastModifiedDate,
  });

  factory Emp.fromJson(Map<String, dynamic> json) => Emp(
        id: json["id"],
        code: json["code"],
        fullName: json["fullName"],
        fullNameEn: json["fullNameEn"],
        idNumber: json["idNumber"],
        fKDefBranchId: json["fK_DefBranchId"],
        fKHrSubBranchId: json["fK_HrSubBranchId"] as int?,
        fKHrManagementId: json["fK_HrManagementId"],
        fKHrDepartmentId: json["fK_HrDepartmentId"],
        imagePath: json["imagePath"] as String?,
        birthDate: json["birthDate"],
        fKHrBloodTypeId: json["fK_HrBloodTypeId"],
        gender: json["gender"],
        placeOfBirth: json["placeOfBirth"],
        fKNationalityId: json["fK_NationalityId"],
        fKDefReligionId: json["fK_DefReligionId"],
        fKSocialStatusId: json["fK_SocialStatusId"],
        hasAirlineTicket: json["hasAirlineTicket"],
        fKHrTicketTypeId: json["fK_HrTicketTypeId"] as int?,
        ticketCount: json["ticketCount"] as int?,
        dateEntitlement: json["dateEntitlement"] as String?,
        contractDueDate: json["contractDueDate"] as String?,
        branchName: json["branchName"],
        contractStartDate: json["contractStartDate"] as String?,
        fKGeneralManagerId: json["fK_GeneralManagerId"],
        fKManagingDirectorId: json["fK_ManagingDirectorId"] as int?,
        fKHumanResourcesManagerId: json["fK_HumanResourcesManagerId"] as int?,
        fKDepartmentManagerId: json["fK_DepartmentManagerId"] as int?,
        fKDirectorGeneralId: json["fK_DirectorGeneralId"] as int?,
        fKHrJobTypeId: json["fK_HrJobTypeId"] as int?,
        jobName: json["jobName"],
        nationalityName: json["nationalityName"] as String?,
        mobile: json["mobile"] as String?,
        dateOfIssued: json["dateOfIssued"] as String?,
        issuerName: json["issuerName"],
        signaturePath: json["signaturePath"] as String?,
        fKManagementId: json["fK_ManagementId"] as int?,
        isActive: json["isActive"],
        branchNameEn: json["branchNameEn"] as String?,
        codeAndName: json["codeAndName"] as String?,
        departmentName: json["departmentName"] as String?,
        creationDate: json["creationDate"],
        nameAndCode: json["nameAndCode"] as String?,
        email: json["email"] as String?,
        surName: json["surName"] as String?,
        salary: json["salary"] as int?,
        isDeleted: json["isDeleted"],
        isDeveloper: json["isDeveloper"],
        fKCostcenterId: json["fK_CostcenterId"],
        creatorName: json["creatorName"] as String?,
        fKCreatorId: json["fK_CreatorId"],
        fKModifiedById: json["fK_ModifiedById"],
        lastModifiedDate: json["lastModifiedDate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "fullName": fullName,
        "fullNameEn": fullNameEn,
        "idNumber": idNumber,
        "fK_DefBranchId": fKDefBranchId,
        "fK_HrSubBranchId": fKHrSubBranchId,
        "fK_HrManagementId": fKHrManagementId,
        "fK_HrDepartmentId": fKHrDepartmentId,
        "imagePath": imagePath,
        "birthDate": birthDate,
        "fK_HrBloodTypeId": fKHrBloodTypeId,
        "gender": gender,
        "placeOfBirth": placeOfBirth,
        "fK_NationalityId": fKNationalityId,
        "fK_DefReligionId": fKDefReligionId,
        "fK_SocialStatusId": fKSocialStatusId,
        "hasAirlineTicket": hasAirlineTicket,
        "fK_HrTicketTypeId": fKHrTicketTypeId,
        "ticketCount": ticketCount,
        "dateEntitlement": dateEntitlement,
        "contractDueDate": contractDueDate,
        "branchName": branchName,
        "contractStartDate": contractStartDate,
        "fK_GeneralManagerId": fKGeneralManagerId,
        "fK_ManagingDirectorId": fKManagingDirectorId,
        "fK_HumanResourcesManagerId": fKHumanResourcesManagerId,
        "fK_DepartmentManagerId": fKDepartmentManagerId,
        "fK_DirectorGeneralId": fKDirectorGeneralId,
        "fK_HrJobTypeId": fKHrJobTypeId,
        "jobName": jobName,
        "nationalityName": nationalityName,
        "mobile": mobile,
        "dateOfIssued": dateOfIssued,
        "issuerName": issuerName,
        "signaturePath": signaturePath,
        "fK_ManagementId": fKManagementId,
        "isActive": isActive,
        "branchNameEn": branchNameEn,
        "codeAndName": codeAndName,
        "departmentName": departmentName,
        "creationDate": creationDate,
        "nameAndCode": nameAndCode,
        "email": email,
        "surName": surName,
        "salary": salary,
        "isDeleted": isDeleted,
        "isDeveloper": isDeveloper,
        "fK_CostcenterId": fKCostcenterId,
        "creatorName": creatorName,
        "fK_CreatorId": fKCreatorId,
        "fK_ModifiedById": fKModifiedById,
        "lastModifiedDate": lastModifiedDate,
      };
}

class User {
  String id;
  String userName;
  String? email;
  String? employeeName;
  String image;
  String surName;
  int fKHrEmployeeId;
  int fKCreatorId;
  String password;
  bool isDeveloper;
  String creationDate;
  String lastModifiedDate;
  bool isActive;
  bool isDeleted;
  int? fKDefBranchId;
  String? employeeCode;

  User({
    required this.id,
    required this.userName,
    this.email,
    required this.employeeName,
    required this.image,
    required this.surName,
    required this.fKHrEmployeeId,
    required this.fKCreatorId,
    required this.password,
    required this.isDeveloper,
    required this.creationDate,
    required this.lastModifiedDate,
    required this.isActive,
    required this.isDeleted,
    this.fKDefBranchId,
    this.employeeCode,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        userName: json["userName"],
        email: json["email"] as String?,
        employeeName: json["employeeName"],
        image: json["image"],
        surName: json["surName"],
        fKHrEmployeeId: json["fK_HrEmployeeId"],
        fKCreatorId: json["fK_CreatorId"],
        password: json["password"],
        isDeveloper: json["isDeveloper"],
        creationDate: json["creationDate"],
        lastModifiedDate: json["lastModifiedDate"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        fKDefBranchId: json["fK_DefBranchId"] as int?,
        employeeCode: json["employeeCode"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "email": email,
        "employeeName": employeeName,
        "image": image,
        "surName": surName,
        "fK_HrEmployeeId": fKHrEmployeeId,
        "fK_CreatorId": fKCreatorId,
        "password": password,
        "isDeveloper": isDeveloper,
        "creationDate": creationDate,
        "lastModifiedDate": lastModifiedDate,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "fK_DefBranchId": fKDefBranchId,
        "employeeCode": employeeCode,
      };
}

class UserRole {
  String? roleName;

  UserRole({
    this.roleName,
  });

  factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
        roleName: json["roleName"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "roleName": roleName,
      };
}
