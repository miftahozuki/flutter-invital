import 'package:flutter/material.dart';
import 'package:plj/models/event.dart';
import 'package:plj/screen/event_detail_page.dart';
import 'package:plj/widgets/event_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  Future<List<Event>> getEvt() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userid = prefs.getInt('UserID');
    String urlEndPoint = "https://invitation-digital.tifint.myhost.id/api/acara/";
    String requestUrl = urlEndPoint + '${userid}';

    final response = await http.get(Uri.parse(requestUrl));

    List<Event> evtList = (json.decode(response.body) as List)
            .map((data) => Event.fromJson(data))
            .toList();

    return evtList;

  }

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
            body: FutureBuilder(
        future: getEvt(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Loading state
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Error state
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Data loaded successfully
            List<Event> evtList = snapshot.data as List<Event>;

            return ListView.builder(
              itemCount: evtList.length,
              itemBuilder: (context, index) {
                Event event = evtList[index];
                return Padding(
                  padding: EdgeInsets.only(left: 30.0, top: 20.0),
                  child: Column(
                    children: [
                      EventCard(
                        Event(
                          husband_name: event.husband_name,
                          wife_name: event.wife_name,
                          event_address: event.event_address,
                          event_date: event.event_date,
                      ),
                      )
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      // body: SafeArea(
      //   bottom: false,
      //   child: ListView(children: [
      //     SizedBox(
      //       height: 50,
      //     ),
      //     Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 30),
      //       child: Column(
      //         children: [
      //           InkWell(
      //             child: EventCard(
      //               Event(
      //                 id: 1,
      //                 husband_name: 'Uzumaki Naruto',
      //                 wife_name: 'Hyuga Hinata',
      //                 event_address: 'Konohagakure',
      //                 event_date: '20 November 2023',
      //               ),
      //             ),
      //             onTap: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) {
      //                     return EventDetailPage();
      //                   },
      //                 ),
      //               );
      //             },
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           InkWell(
      //             child: EventCard(
      //               Event(
      //                 id: 1,
      //                 husband_name: 'Loid Forger',
      //                 wife_name: 'Yor Briar',
      //                 event_address: 'Westalis',
      //                 event_date: '24 November 2023',
      //               ),
      //             ),
      //             onTap: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) {
      //                     return EventDetailPage();
      //                   },
      //                 ),
      //               );
      //             },
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           ElevatedButton(onPressed: () => {
      //             getEvt()
      //           }, child: Text('Tombol'))
      //         ],
      //       ),
      //     ),
      //   ]),
      // ),
    );
  }
}
