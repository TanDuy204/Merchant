import 'dart:convert';

import 'package:get/get.dart';
import 'package:merchant/models/point.dart';
import 'package:merchant/models/user.dart';
import 'package:merchant/providers/api_provider.dart';

class PointRepository {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();

  Future<List<Point>> getAllArrangedSchedule() async {
    try {
      final response = await _apiProvider.get('arranged-schedule');

      if (response['success'] == true && response['data'] != null) {
        final List<dynamic> scheduleData = response['data'];

        final driversResponse = await _apiProvider.get('driver');
        Map<int, User> driversMap = {};

        if (driversResponse['success'] == true &&
            driversResponse['data'] != null) {
          for (var driverJson in driversResponse['data']) {
            User driver = User.fromJson(driverJson);
            if (driver.id != null) {
              driversMap[driver.id!] = driver;
            }
          }
        }
        List<Point> points = [];
        for (var scheduleJson in scheduleData) {
          try {
            Point point = Point.fromJson(scheduleJson);
            if (point.driverId != null &&
                driversMap.containsKey(point.driverId)) {
              point.driver = driversMap[point.driverId];
            }
            points.add(point);
          } catch (e) {
            print('Error parsing point: $e');
          }
        }
        return points;
      }
      return [];
    } catch (e) {
      print('Error fetching arranged schedule: $e');
      return [];
    }
  }

  Future<List<Point>> getAllTodaySchedule() async {
    try {
      final response = await _apiProvider.get('today-schedule');

      if (response['success'] == true && response['data'] != null) {
        final List<dynamic> scheduleData = response['data'];

        final driversResponse = await _apiProvider.get('driver');
        Map<int, User> driversMap = {};

        if (driversResponse['success'] == true &&
            driversResponse['data'] != null) {
          for (var driverJson in driversResponse['data']) {
            User driver = User.fromJson(driverJson);
            if (driver.id != null) {
              driversMap[driver.id!] = driver;
            }
          }
        }
        List<Point> points = [];
        for (var scheduleJson in scheduleData) {
          try {
            Point point = Point.fromJson(scheduleJson);
            if (point.driverId != null &&
                driversMap.containsKey(point.driverId)) {
              point.driver = driversMap[point.driverId];
            }
            points.add(point);
          } catch (e) {
            print('Error parsing point: $e');
          }
        }
        return points;
      }
      return [];
    } catch (e) {
      print('Error fetching arranged schedule: $e');
      return [];
    }
  }

  Future<List<Point>> getAllNotyetSchedule() async {
    DateTime? parseCustomDate(String? dateStr) {
      if (dateStr == null) return null;
      try {
        final parts = dateStr.split('/');
        if (parts.length == 3) {
          final day = int.parse(parts[0]);
          final month = int.parse(parts[1]);
          final year = int.parse(parts[2]);
          return DateTime(year, month, day);
        }
      } catch (_) {}
      return null;
    }

    try {
      final response = await _apiProvider.get('notyet-schedule');

      if (response['success'] == true && response['data'] != null) {
        final List<dynamic> scheduleData = response['data'];
        List<Point> points = [];

        for (var scheduleJson in scheduleData) {
          try {
            final String dateStr = scheduleJson['date'] ?? '';
            final DateTime? collectionDate = parseCustomDate(dateStr);

            final List<dynamic> companies = scheduleJson['companies'] ?? [];

            for (int i = 0; i < companies.length; i++) {
              final company = companies[i];
              final pointData = {
                'id': (scheduleJson['id'] ?? 0) * 1000 + i,
                'code': null,
                'company_name': company['name'] ?? '',
                'location_details': company['location'] ?? '',
                'area': null,
                'vehicle_id': null,
                'driver_id': null,
                'status': 'pending',
                'collection_date': collectionDate?.toIso8601String(),
                'waste_type': scheduleJson['type'] ?? '',
                'weight': scheduleJson['capacity'] ?? '',
                'total_price': null,
                'images': [],
                'report_id': null,
                'created_at': null,
                'updated_at': null,
                'truck': null,
                'driver': null,
                'goods': [],
                'additional_costs': [],
              };

              Point point = Point.fromJson(pointData);
              points.add(point);
            }
          } catch (e) {
            print('Error parsing schedule item: $e');
          }
        }
        return points;
      }
      return [];
    } catch (e) {
      print('Error fetching notyet schedule: $e');
      return [];
    }
  }

  Future<Point?> getScheduleDetail(int id) async {
    try {
      final response = await _apiProvider.get('schedule-detail/$id');

      if (response['success'] == true && response['data'] != null) {
        final pointData = response['data']['point'];

        if (pointData['images'] is String && pointData['images'].isNotEmpty) {
          try {
            jsonDecode(pointData['images']);
          } catch (e) {
            print('Images is not valid JSON: ${pointData['images']}');
          }
        }

        pointData['goods'] ??= [];
        pointData['additional_costs'] ??= [];

        Point point = Point.fromJson(pointData);
        return point;
      }
      return null;
    } catch (e) {
      print('Error fetching schedule detail: $e');
      return null;
    }
  }
}
