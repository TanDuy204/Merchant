class Schedule {
  final String id;
  final String companyName;
  final String description;
  final String from;
  final String to;
  final String contactName;
  final String contactPhone;
  final String cargoType;
  final String status;
  final DateTime datetime;
  final String note;
  final double price;

  Schedule({
    required this.id,
    required this.companyName,
    required this.description,
    required this.from,
    required this.to,
    required this.contactName,
    required this.contactPhone,
    required this.cargoType,
    required this.status,
    required this.datetime,
    required this.note,
    required this.price,
  });
}
