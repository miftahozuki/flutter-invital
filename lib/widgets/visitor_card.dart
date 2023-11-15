import 'package:flutter/material.dart';

import 'package:plj/models/visitor.dart';
import 'package:plj/theme.dart';

class VisitorCard extends StatelessWidget {
  final Visitor visitor;

  const VisitorCard(this.visitor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
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
                      visitor.name,
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
                      visitor.address,
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
