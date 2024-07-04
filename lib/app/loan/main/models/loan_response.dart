class LoanResponse {
  final List<Loan>? all;
  final List<Loan>? pending;
  final List<Loan>? approved;
  final List<Loan>? rejected;
  final double loansPercentage;
  final String? totalLoans;
  final double pendingPercentage;
  final double approvedPercentage;
  final double rejectedPercentage;

  LoanResponse({
    required this.all,
    required this.pending,
    required this.approved,
    required this.rejected,
    required this.loansPercentage,
    required this.totalLoans,
    required this.pendingPercentage,
    required this.approvedPercentage,
    required this.rejectedPercentage,
  });

  factory LoanResponse.fromJson(Map<String, dynamic> json) => LoanResponse(
        all: List<Loan>.from(json["all"].map((x) => Loan.fromJson(x))),
        pending: List<Loan>.from(json["pending"].map((x) => Loan.fromJson(x))),
        approved: List<Loan>.from(json["approved"].map((x) => x)),
        rejected:
            List<Loan>.from(json["rejected"].map((x) => Loan.fromJson(x))),
        loansPercentage: json["loansPercentage"]?.toDouble(),
        totalLoans: json["totalLoans"],
        pendingPercentage: json["pendingPercentage"],
        approvedPercentage: double.parse(json["approvedPercentage"].toString()),
        rejectedPercentage: json["rejectedPercentage"],
      );

  Map<String, dynamic> toJson() => {
        "all": List<Loan>.from(all != null ? all!.map((x) => x.toJson()) : []),
        "pending": List<Loan>.from(
            pending != null ? pending!.map((x) => x.toJson()) : []),
        "approved":
            List<Loan>.from(approved != null ? approved!.map((x) => x) : []),
        "rejected": List<Loan>.from(
            rejected != null ? rejected!.map((x) => x.toJson()) : []),
        "loansPercentage": loansPercentage,
        "totalLoans": totalLoans,
        "pendingPercentage": pendingPercentage,
        "approvedPercentage": approvedPercentage,
        "rejectedPercentage": rejectedPercentage,
      };
}

class Loan {
  final int id;
  final int requestLoanId;
  final String title;
  final int fKHrEmployeeId;
  final int fKReqStatusId;
  final String status;
  final double amount;
  final String creationDate;
  String? icon;
  int? type;

  Loan({
    required this.id,
    required this.requestLoanId,
    required this.title,
    required this.fKHrEmployeeId,
    required this.fKReqStatusId,
    required this.status,
    required this.amount,
    required this.creationDate,
    this.icon,
    this.type,
  });

  factory Loan.fromJson(Map<String, dynamic> json) => Loan(
        id: json["id"],
        requestLoanId: json["requestLoanId"],
        title: json["title"],
        fKHrEmployeeId: json["fK_HrEmployeeId"],
        fKReqStatusId: json["fK_ReqStatusId"],
        status: json["status"],
        amount: json["amount"],
        creationDate: json["creationDate"],
        icon: null,
        type: null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "requestLoanId": requestLoanId,
        "title": title,
        "fK_HrEmployeeId": fKHrEmployeeId,
        "fK_ReqStatusId": fKReqStatusId,
        "status": status,
        "amount": amount,
        "creationDate": creationDate,
        "icon": icon,
        "type": type,
      };
}
