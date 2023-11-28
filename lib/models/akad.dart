// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Akad {
  int id;
  String akad_day;
  DateTime akad_date;
  TimeOfDay start_hour;
  TimeOfDay end_hour;
  String location;

  Akad({
    required this.id,
    required this.akad_day,
    required this.akad_date,
    required this.start_hour,
    required this.end_hour,
    required this.location,
  });
}
