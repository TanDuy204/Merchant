class reports {
  final int id;
  final String code;
  final String content;
  final int totla_trips;
  final dynamic total_amount;
  final String waste_type;
  final String status;
  final DateTime sent_date;

  reports(
      this.id,
      this.code,
      this.content,
      this.totla_trips,
      this.total_amount,
      this.waste_type,
      this.status,
      this.sent_date,
      this.mtac_received_date,
      this.mtac_response_date,
      this.created_at,
      this.updated_at);

  final DateTime mtac_received_date;
  final DateTime mtac_response_date;
  final DateTime created_at;
  final DateTime updated_at;
}