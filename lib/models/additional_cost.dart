class additional_cost {
  int? id;
  int? collectionPointId;
  String? category;
  int? quantity;
  double? unitPrice;
  double? totalPrice;
  String? note;

  additional_cost(this.id, this.collectionPointId, this.category, this.quantity,
      this.unitPrice, this.totalPrice, this.note);


  additional_cost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    collectionPointId = json['collection_point_id'];
    category = json['category'];
    quantity = json['quantity'];

    unitPrice = json['unit_price'] != null
        ? double.tryParse(json['unit_price'].toString()) ?? 0.0
        : 0.0;

    totalPrice = json['total_price'] != null
        ? double.tryParse(json['total_price'].toString()) ?? 0.0
        : 0.0;

    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['collection_point_id'] = collectionPointId;
    data['category'] = category;
    data['quantity'] = quantity;
    data['unit_price'] = unitPrice;
    data['total_price'] = totalPrice;
    data['note'] = note;
    return data;
  }
}