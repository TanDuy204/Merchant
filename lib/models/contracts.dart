class contracts {
  final int id;
  final String contract_number;
  final String region;
  final String content;
  final String customer_contract_number;
  final String mailing_address;
  final String service_group;
  final String service_type;
  final String status;
  final String supplier_name;
  final String reponsible_person_name;
  final String contact_name;
  final String contact_phone;
  final String contact_email;
  final String customer_address;
  final String file_path;
  final DateTime signed_date;
  final DateTime end_date;
  final DateTime effective_date;
  final DateTime created_date;
  final DateTime updated_date;

  contracts(
      this.id,
      this.contract_number,
      this.region,
      this.content,
      this.customer_contract_number,
      this.mailing_address,
      this.service_group,
      this.service_type,
      this.status,
      this.supplier_name,
      this.reponsible_person_name,
      this.contact_name,
      this.contact_phone,
      this.contact_email,
      this.customer_address,
      this.file_path,
      this.signed_date,
      this.end_date,
      this.effective_date,
      this.created_date,
      this.updated_date);
}