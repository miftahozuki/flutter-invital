// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Resepsi {
  int id;
  String resepsi_day;
  DateTime resepsi_date;
  TimeOfDay start_hour;
  TimeOfDay end_hour;
  String location;

  Resepsi({
    required this.id,
    required this.resepsi_day,
    required this.resepsi_date,
    required this.start_hour,
    required this.end_hour,
    required this.location,
  });
}
