class Truck {
  int? id;
  String? plateNumber;
  String? name;
  String? brand;
  String? type;
  int? capacity;
  String? status;

  Truck(this.id, this.plateNumber, this.name, this.brand, this.type,
      this.capacity, this.status);

  Truck.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    plateNumber = json['plate_number'];
    name = json['name'];
    brand = json['brand'];
    type = json['type'];
    capacity = json['capacity'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['plate_number'] = plateNumber;
    data['name'] = name;
    data['brand'] = brand;
    data['type'] = type;
    data['capacity'] = capacity;
    data['status'] = status;
    return data;
  }

  String get truckInfo {
    return '$plateNumber - $name ($capacity tấn)';
  }
}
