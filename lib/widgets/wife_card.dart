import 'package:flutter/material.dart';
import 'package:plj/theme.dart';

class WifeCard extends StatelessWidget {
  const WifeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 34,
          width: 500,
          decoration: BoxDecoration(
            border: Border.all(
              color: strokeColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Text(
                  'Nama Istri',
                  style: blackTextStyle,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 34,
          width: 500,
          decoration: BoxDecoration(
            border: Border.all(
              color: strokeColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Text(
                  'Nama Bapak Istri',
                  style: blackTextStyle,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 34,
          width: 500,
          decoration: BoxDecoration(
            border: Border.all(
              color: strokeColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Text(
                  'Nama Ibu Istri',
                  style: blackTextStyle,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
