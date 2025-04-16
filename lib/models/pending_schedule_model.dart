// To parse this JSON data, do
//
//     final pendingScheduleModel = pendingScheduleModelFromJson(jsonString);

import 'dart:convert';

PendingScheduleModel pendingScheduleModelFromJson(String str) =>
    PendingScheduleModel.fromJson(json.decode(str));

String pendingScheduleModelToJson(PendingScheduleModel data) =>
    json.encode(data.toJson());

class PendingScheduleModel {
  String date;
  String wasteType;
  String weight;
  String worker;
  List<CompanyDetail> companyDetails;

  PendingScheduleModel({
    required this.date,
    required this.wasteType,
    required this.weight,
    required this.worker,
    required this.companyDetails,
  });

  factory PendingScheduleModel.fromJson(Map<String, dynamic> json) =>
      PendingScheduleModel(
        date: json["date"],
        wasteType: json["wasteType"],
        weight: json["weight"],
        worker: json["worker"],
        companyDetails: List<CompanyDetail>.from(
            json["companyDetails"].map((x) => CompanyDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "wasteType": wasteType,
        "weight": weight,
        "worker": worker,
        "companyDetails":
            List<dynamic>.from(companyDetails.map((x) => x.toJson())),
      };
}

class CompanyDetail {
  String companyName;
  String address;
  String contactName;
  String contactPhone;
  String quantity;
  String note;

  CompanyDetail({
    required this.companyName,
    required this.address,
    required this.contactName,
    required this.contactPhone,
    required this.quantity,
    required this.note,
  });

  factory CompanyDetail.fromJson(Map<String, dynamic> json) => CompanyDetail(
        companyName: json["companyName"],
        address: json["address"],
        contactName: json["contactName"],
        contactPhone: json["contactPhone"],
        quantity: json["quantity"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "companyName": companyName,
        "address": address,
        "contactName": contactName,
        "contactPhone": contactPhone,
        "quantity": quantity,
        "note": note,
      };
}
