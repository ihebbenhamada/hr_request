import 'dart:convert';

TicketResponse ticketResponseFromJson(String str) =>
    TicketResponse.fromJson(json.decode(str));

String ticketResponseToJson(TicketResponse data) => json.encode(data.toJson());

class TicketResponse {
  List<Ticket> all;
  List<Ticket> pending;
  List<Ticket> approved;
  List<Ticket> rejected;

  TicketResponse({
    required this.all,
    required this.pending,
    required this.approved,
    required this.rejected,
  });

  factory TicketResponse.fromJson(Map<String, dynamic> json) => TicketResponse(
        all: List<Ticket>.from(json["all"].map((x) => Ticket.fromJson(x))),
        pending:
            List<Ticket>.from(json["pending"].map((x) => Ticket.fromJson(x))),
        approved: List<Ticket>.from(json["approved"].map((x) => x)),
        rejected:
            List<Ticket>.from(json["rejected"].map((x) => Ticket.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "all": List<Ticket>.from(all.map((x) => x.toJson())),
        "pending": List<Ticket>.from(pending.map((x) => x.toJson())),
        "approved": List<Ticket>.from(approved.map((x) => x)),
        "rejected": List<Ticket>.from(rejected.map((x) => x.toJson())),
      };
}

class Ticket {
  int id;
  int requestTicketId;
  int fKHrEmployeeId;
  int fKReqStatusId;
  String status;
  String creationDate;

  Ticket({
    required this.id,
    required this.requestTicketId,
    required this.fKHrEmployeeId,
    required this.fKReqStatusId,
    required this.status,
    required this.creationDate,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        id: json["id"],
        requestTicketId: json["requestTicketId"],
        fKHrEmployeeId: json["fK_HrEmployeeId"],
        fKReqStatusId: json["fK_ReqStatusId"],
        status: json["status"],
        creationDate: json["creationDate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "requestTicketId": requestTicketId,
        "fK_HrEmployeeId": fKHrEmployeeId,
        "fK_ReqStatusId": fKReqStatusId,
        "status": status,
        "creationDate": creationDate,
      };
}
