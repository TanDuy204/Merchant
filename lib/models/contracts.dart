// To parse this JSON data, do
//
//     final contracts = contractsFromJson(jsonString);

import 'dart:convert';

Contract contractsFromJson(String str) => Contract.fromJson(json.decode(str));

String contractToJson(Contract data) => json.encode(data.toJson());

class Contract {
  int? id;
  String? contractNumber;
  String? region;
  String? content;
  String? customerContractNumber;
  String? mailingAddress;
  String? serviceGroup;
  String? serviceType;
  String? status;
  String? supplierName;
  String? responsiblePersonName;
  String? contactName;
  String? contactPhone;
  String? contactEmail;
  String? contactAddress;
  String? customerName;
  String? customerEmail;
  String? customerAddress;
  String? filePath;
  DateTime? signedDate;
  DateTime? endDate;
  DateTime? effectiveDate;
  DateTime? createdAt;
  DateTime? updatedAt;

  Contract({
    this.id,
    this.contractNumber,
    this.region,
    this.content,
    this.customerContractNumber,
    this.mailingAddress,
    this.serviceGroup,
    this.serviceType,
    this.status,
    this.supplierName,
    this.responsiblePersonName,
    this.contactName,
    this.contactPhone,
    this.contactEmail,
    this.contactAddress,
    this.customerName,
    this.customerEmail,
    this.customerAddress,
    this.filePath,
    this.signedDate,
    this.endDate,
    this.effectiveDate,
    this.createdAt,
    this.updatedAt,
  });

  factory Contract.fromJson(Map<String, dynamic> json) => Contract(
        id: json["id"],
        contractNumber: json["contract_number"],
        region: json["region"],
        content: json["content"],
        customerContractNumber: json["customer_contract_number"],
        mailingAddress: json["mailing_address"],
        serviceGroup: json["service_group"],
        serviceType: json["service_type"],
        status: json["status"],
        supplierName: json["supplier_name"],
        responsiblePersonName: json["responsible_person_name"],
        contactName: json["contact_name"],
        contactPhone: json["contact_phone"],
        contactEmail: json["contact_email"],
        contactAddress: json["contact_address"],
        customerName: json["customer_name"],
        customerEmail: json["customer_email"],
        customerAddress: json["customer_address"],
        filePath: json["file_path"],
        signedDate: json["signed_date"] == null
            ? null
            : DateTime.parse(json["signed_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        effectiveDate: json["effective_date"] == null
            ? null
            : DateTime.parse(json["effective_date"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "contract_number": contractNumber,
        "region": region,
        "content": content,
        "customer_contract_number": customerContractNumber,
        "mailing_address": mailingAddress,
        "service_group": serviceGroup,
        "service_type": serviceType,
        "status": status,
        "supplier_name": supplierName,
        "responsible_person_name": responsiblePersonName,
        "contact_name": contactName,
        "contact_phone": contactPhone,
        "contact_email": contactEmail,
        "contact_address": contactAddress,
        "customer_name": customerName,
        "customer_email": customerEmail,
        "customer_address": customerAddress,
        "file_path": filePath,
        "signed_date": signedDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "effective_date": effectiveDate?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
