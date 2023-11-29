import 'package:flutter/material.dart';

import 'package:plj/models/event.dart';
import 'package:plj/theme.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard(this.event, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(
                  color: strokeColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${event.husband_name}',
                      style: blackTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '&',
                      style: blackTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${event.wife_name}',
                      style: blackTextStyle,
                    ),
                    Divider(
                      color:
                          strokeColor, // Sesuaikan warna garis dengan desain Anda
                      thickness:
                          2, // Sesuaikan ketebalan garis dengan desain Anda
                      height: 20, // Sesuaikan tinggi garis dengan desain Anda
                    ),
                    Text(
                      event.event_address,
                      style: blackTextStyle,
                    ),
                    Divider(
                      color:
                          strokeColor, // Sesuaikan warna garis dengan desain Anda
                      thickness:
                          2, // Sesuaikan ketebalan garis dengan desain Anda
                      height: 20, // Sesuaikan tinggi garis dengan desain Anda
                    ),
                    Text(
                      event.event_date,
                      style: blackTextStyle,
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
