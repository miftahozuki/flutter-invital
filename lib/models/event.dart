// ignore_for_file: public_member_api_docs, sort_constructors_first
class Event {
  int? id;
  String husband_name;
  String wife_name;
  String event_address;
  String event_date;

  Event({
     this.id,
    required this.husband_name,
    required this.wife_name,
    required this.event_address,
    required this.event_date,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      husband_name: json['nama_suami'],
      wife_name: json['nama_istri'],
      event_address: json['alamat_resepsi'],
      event_date: json['tgl_resepsi'],
    );
  }
}
