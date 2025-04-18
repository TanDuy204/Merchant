import 'package:intl/intl.dart';
import 'truck.dart';
import 'user.dart';
import 'goods.dart';
import 'additional_cost.dart';
import 'dart:convert';

class point {
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
  double? weight;
  double? totalPrice;
  List<String>? images;
  int? reportId;
  truck? vehicle;
  user? driver;
  List<goods>? items;
  List<additional_cost>? additionalCosts;

  point(
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
      this.vehicle,
      this.driver,
      this.items,
      this.additionalCosts);

  point.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    companyName = json['company_name'];
    locationDetails = json['location_details'];
    area = json['area'];
    vehicleId = json['vehicle_id'];
    driverId = json['driver_id'];
    status = json['status'];

    if (json['collection_date'] != null) {
      collectionDate = DateTime.parse(json['collection_date']);
    }

    wasteType = json['waste_type'];

    // Handle numeric values
    weight = json['weight'] != null
        ? double.tryParse(json['weight'].toString()) ?? 0.0
        : 0.0;

    totalPrice = json['total_price'] != null
        ? double.tryParse(json['total_price'].toString()) ?? 0.0
        : 0.0;

    // Handle images JSON
    if (json['images'] != null) {
      if (json['images'] is String) {
        try {
          var decodedImages = jsonDecode(json['images']);
          images = List<String>.from(decodedImages);
        } catch (e) {
          images = [];
        }
      } else if (json['images'] is List) {
        images = List<String>.from(json['images']);
      }
    } else {
      images = [];
    }

    reportId = json['report_id'];

    // Handle nested objects
    if (json['vehicle'] != null) {
      vehicle = truck.fromJson(json['vehicle']);
    }

    if (json['driver'] != null) {
      driver = user.fromJson(json['driver']);
    }

    // Handle goods list
    if (json['items'] != null) {
      items = <goods>[];
      json['goods'].forEach((v) {
        items!.add(goods.fromJson(v));
      });
    }

    // Handle additional costs list
    if (json['additionalCosts'] != null) {
      additionalCosts = <additional_cost>[];
      json['additionalCosts'].forEach((v) {
        additionalCosts!.add(additional_cost.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['company_name'] = companyName;
    data['location_details'] = locationDetails;
    data['area'] = area;
    data['vehicle_id'] = vehicleId;
    data['driver_id'] = driverId;
    data['status'] = status;

    if (collectionDate != null) {
      data['collection_date'] = DateFormat('yyyy-MM-dd').format(collectionDate!);
    }

    data['waste_type'] = wasteType;
    data['weight'] = weight;
    data['total_price'] = totalPrice;

    if (images != null && images!.isNotEmpty) {
      data['images'] = images;
    }

    data['report_id'] = reportId;
    return data;
  }

  String get formattedDate {
    if (collectionDate == null) return '';
    return DateFormat('dd/MM/yyyy').format(collectionDate!);
  }

  String get formattedWeight {
    if (weight == null) return '0 kg';
    return '${weight!.toStringAsFixed(2)} kg';
  }

  String get formattedTotalPrice {
    if (totalPrice == null) return '0 đ';
    final formatter = NumberFormat('#,###', 'vi_VN');
    return '${formatter.format(totalPrice)} đ';
  }

  String get statusDisplay {
    switch (status) {
      case 'chưa sắp':
        return 'Chưa sắp xếp';
      case 'đã sắp':
        return 'Đã sắp xếp';
      case 'đã thu gom':
        return 'Đã thu gom';
      default:
        return status ?? '';
    }
  }
}