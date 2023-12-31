import 'package:flutter/material.dart';

import 'package:plj/models/visitor.dart';
import 'package:plj/theme.dart';

class VisitorCard extends StatelessWidget {
  final Visitor visitor;

  const VisitorCard(this.visitor, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 220,
                width: 350,
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
                      Text('Nama: ${visitor.name}',
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
                        'Tamu: ${visitor.status}',
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
                        'Jenis Kelamin: ${visitor.gender}',
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
                        'Alamat: ${visitor.address}',
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
                        'Waktu: ${visitor.waktu}',
                        style: blackTextStyle,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
