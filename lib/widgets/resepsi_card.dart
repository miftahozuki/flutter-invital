import 'package:flutter/material.dart';
import 'package:plj/theme.dart';

class ResepsiCard extends StatelessWidget {
  const ResepsiCard({super.key});

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
                  'Hari Resepsi',
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
                  'Tanggal Resepsi',
                  style: blackTextStyle,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
              height: 34,
              width: 150,
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
                      'Jam Resepsi',
                      style: blackTextStyle,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text('S/D'),
            SizedBox(
              width: 8,
            ),
            Container(
              height: 34,
              width: 150,
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
                      '...',
                      style: blackTextStyle,
                    ),
                  )
                ],
              ),
            ),
          ],
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
                  'Lokasi Resepsi',
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