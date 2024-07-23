import 'dart:convert';

class ComplaintResponse {
  int totalCount;
  List<ReqComplaintMobile> reqComplaintMobile;
  ReqComplaintChart reqComplaintChart;

  ComplaintResponse({
    required this.totalCount,
    required this.reqComplaintMobile,
    required this.reqComplaintChart,
  });

  factory ComplaintResponse.fromRawJson(String str) =>
      ComplaintResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ComplaintResponse.fromJson(Map<String, dynamic> json) =>
      ComplaintResponse(
        totalCount: json["totalCount"],
        reqComplaintMobile: List<ReqComplaintMobile>.from(
            json["reqComplaintMobile"]
                .map((x) => ReqComplaintMobile.fromJson(x))),
        reqComplaintChart:
            ReqComplaintChart.fromJson(json["reqComplaintChart"]),
      );

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
        "reqComplaintMobile":
            List<dynamic>.from(reqComplaintMobile.map((x) => x.toJson())),
        "reqComplaintChart": reqComplaintChart.toJson(),
      };
}

class ReqComplaintChart {
  List<String> lastSixMonths;
  List<int> count;

  ReqComplaintChart({
    required this.lastSixMonths,
    required this.count,
  });

  factory ReqComplaintChart.fromRawJson(String str) =>
      ReqComplaintChart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReqComplaintChart.fromJson(Map<String, dynamic> json) =>
      ReqComplaintChart(
        lastSixMonths: List<String>.from(json["lastSixMonths"].map((x) => x)),
        count: List<int>.from(json["count"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "lastSixMonths": List<dynamic>.from(lastSixMonths.map((x) => x)),
        "count": List<dynamic>.from(count.map((x) => x)),
      };
}

class ReqComplaintMobile {
  int id;
  int fkHrEmployeeId;
  String senderName;
  String senderImagePath;
  String subject;
  String description;
  int fkReqStatusId;
  String complaintDate;

  ReqComplaintMobile({
    required this.id,
    required this.fkHrEmployeeId,
    required this.senderName,
    required this.senderImagePath,
    required this.subject,
    required this.description,
    required this.fkReqStatusId,
    required this.complaintDate,
  });

  factory ReqComplaintMobile.fromRawJson(String str) =>
      ReqComplaintMobile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReqComplaintMobile.fromJson(Map<String, dynamic> json) =>
      ReqComplaintMobile(
        id: json["id"],
        fkHrEmployeeId: json["fK_HrEmployeeId"],
        senderName: json["senderName"],
        senderImagePath: json["senderImagePath"],
        subject: json["subject"],
        description: json["description"],
        fkReqStatusId: json["fK_ReqStatusId"],
        complaintDate: json["complaintDate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fK_HrEmployeeId": fkHrEmployeeId,
        "senderName": senderName,
        "senderImagePath": senderImagePath,
        "subject": subject,
        "description": description,
        "fK_ReqStatusId": fkReqStatusId,
        "complaintDate": complaintDate,
      };
}
