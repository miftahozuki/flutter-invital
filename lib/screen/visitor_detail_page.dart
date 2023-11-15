import 'package:flutter/material.dart';
import 'package:plj/widgets/visitor_card.dart';
import 'package:plj/models/visitor.dart';
import 'package:plj/widgets/visitor_detail_card.dart';

import '../theme.dart';

class VisitorDetailPage extends StatelessWidget {
  const VisitorDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Center(
          child: Text(
            'Detail Tamu',
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
                VisitorDetailCard(
                  Visitor(
                    id: 1,
                    name: 'Ahmad Haidar Kamal',
                    gender: 'Laki-laki',
                    address: 'Banyuwangi',
                    visitor_status: 'VIP',
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
