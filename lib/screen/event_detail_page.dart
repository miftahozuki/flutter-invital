import 'package:flutter/material.dart';
import 'package:plj/theme.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Center(
          child: Text(
            'Detail Acara',
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Text(
                'This is Event Detail',
                style: blackTextStyle.copyWith(
                    fontSize: 20, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
