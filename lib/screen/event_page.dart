import 'package:flutter/material.dart';
import 'package:plj/models/event.dart';
import 'package:plj/widgets/event_card.dart';

import '../theme.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Center(
          child: Text(
            'Daftar Acara',
            style: whiteTextStyle.copyWith(
              fontSize: 28,
            ),
          ),
        ),
        actions: [
          Container(
            margin:
                const EdgeInsets.only(right: 50), // Tambahkan margin sebesar 30
          ),
        ],
        toolbarHeight: 80, // Mengatur tinggi AppBar
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                EventCard(
                  Event(
                    id: 1,
                    husband_name: 'Uzumaki Naruto',
                    wife_name: 'Hyuga Hinata',
                    event_address: 'Konohagakure',
                    event_date: '20 November 2023',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                EventCard(
                  Event(
                    id: 1,
                    husband_name: 'Loid Forger',
                    wife_name: 'Yor Briar',
                    event_address: 'Westalis',
                    event_date: '24 November 2023',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
