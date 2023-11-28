import 'package:flutter/material.dart';
import 'package:plj/theme.dart';

class HusbandCard extends StatelessWidget {
  const HusbandCard({super.key});

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
                  'data',
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
                  'data',
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
                  'data',
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
