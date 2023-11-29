import 'package:flutter/material.dart';
import 'package:plj/models/event.dart';
import 'package:plj/screen/event_detail_page.dart';
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
                InkWell(
                  child: EventCard(
                    Event(
                      id: 1,
                      husband_name: 'Muhammad Zainuddin',
                      wife_name: 'Qomariatun',
                      event_address: 'Banyuwangi',
                      event_date: '15 November 2023',
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return EventDetailPage();
                        },
                      ),
                    );
                  },
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
