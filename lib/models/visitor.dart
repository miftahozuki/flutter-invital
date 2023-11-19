// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

List<Visitor> visitorModelFromJson(String str) =>
  List<Visitor>.from(json.decode(str).map((x) => Visitor.fromJson(x)));

class Visitor {
  int? id;
  String name;
  String gender;
  String address;
  String status;
  String waktu;
  
  Visitor({
    this.id,
    required this.name,
    required this.gender,
    required this.address,
    required this.status,
    required this.waktu
  });

  factory Visitor.fromJson(Map<String, dynamic> json) {
    return Visitor(
      id: json['id'],
      address: json['alamat'],
      gender: json['kelamin'],
      name: json['nama_tamu'],
      status: json['status'],
      waktu: json['waktu'],
    );
  }
}


