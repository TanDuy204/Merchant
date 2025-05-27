import 'dart:convert';

import 'package:merchant/models/truck.dart';
import 'package:merchant/models/user.dart';

import 'additional_cost.dart';
import 'goods.dart';

Point pointFromJson(String str) => Point.fromJson(json.decode(str));

String pointToJson(Point data) => json.encode(data.toJson());

class Point {
  int? id;
  String? code;
  String? companyName;
  String? locationDetails;
  String? area;
  int? vehicleId;
  int? driverId;
  String? status;
  DateTime? collectionDate;
  String? wasteType;
  String? weight;
  String? totalPrice;
  List<String>? images;
  int? reportId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Truck? truck;
  User? driver;
  List<Goods>? goods;
  List<AdditionalCost>? additionalCosts;

  Point({
    this.id,
    this.code,
    this.companyName,
    this.locationDetails,
    this.area,
    this.vehicleId,
    this.driverId,
    this.status,
    this.collectionDate,
    this.wasteType,
    this.weight,
    this.totalPrice,
    this.images,
    this.reportId,
    this.createdAt,
    this.updatedAt,
    this.truck,
    this.driver,
    this.goods,
    this.additionalCosts,
  });

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(
      id: json["id"],
      code: json["code"],
      companyName: json["company_name"],
      locationDetails: json["location_details"],
      area: json["area"],
      vehicleId: json["vehicle_id"],
      driverId: json["driver_id"],
      status: json["status"],
      collectionDate: json["collection_date"] == null
          ? null
          : DateTime.parse(json["collection_date"]),
      wasteType: json["waste_type"],
      weight: json["weight"],
      totalPrice: json["total_price"],
      // Handle images as List<String>
      images: json["images"] == null
          ? []
          : json["images"] is List
              ? List<String>.from(json["images"])
              : json["images"] is String && json["images"].isNotEmpty
                  ? [json["images"]] // Single string to list
                  : [],
      reportId: json["report_id"],
      createdAt: json["created_at"] == null
          ? null
          : DateTime.parse(json["created_at"]),
      updatedAt: json["updated_at"] == null
          ? null
          : DateTime.parse(json["updated_at"]),
      truck: json["truck"] == null ? null : Truck.fromJson(json["truck"]),
      driver: json["driver"] == null ? null : User.fromJson(json["driver"]),
      goods: json["goods"] == null
          ? []
          : List<Goods>.from(json["goods"]!.map((x) => Goods.fromJson(x))),
      additionalCosts: json["additional_costs"] == null
          ? []
          : List<AdditionalCost>.from(
              json["additional_costs"]!.map((x) => AdditionalCost.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "company_name": companyName,
        "location_details": locationDetails,
        "area": area,
        "vehicle_id": vehicleId,
        "driver_id": driverId,
        "status": status,
        "collection_date": collectionDate?.toIso8601String(),
        "waste_type": wasteType,
        "weight": weight,
        "total_price": totalPrice,
        "images": images,
        "report_id": reportId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "truck": truck?.toJson(),
        "driver": driver?.toJson(),
        "goods": goods == null
            ? []
            : List<dynamic>.from(goods!.map((x) => x.toJson())),
        "additional_costs": additionalCosts == null
            ? []
            : List<dynamic>.from(additionalCosts!.map((x) => x.toJson())),
      };
}
