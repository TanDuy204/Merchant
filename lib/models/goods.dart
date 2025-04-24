class goods {
  int? id;
  int? collectionPointId;
  String? code;
  String? name;
  double? klGom;
  String? deliveryPoint;

  goods(this.id, this.collectionPointId, this.code, this.name, this.klGom,
      this.deliveryPoint);

  goods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    collectionPointId = json['collection_point_id'];
    code = json['code'];
    name = json['name'];
    klGom = json['kl_gom'] != null
        ? double.tryParse(json['kl_gom'].toString()) ?? 0.0
        : 0.0;
    deliveryPoint = json['delivery_point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['collection_point_id'] = collectionPointId;
    data['code'] = code;
    data['name'] = name;
    data['kl_gom'] = klGom;
    data['delivery_point'] = deliveryPoint;
    return data;
  }
}