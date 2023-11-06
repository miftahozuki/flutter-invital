import 'package:flutter/material.dart';
import 'package:plj/theme.dart';

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
                const EdgeInsets.only(right: 30), // Tambahkan margin sebesar 30
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                shape: const CircleBorder(),
                child: IconButton(
                  icon: const Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    // Tambahkan aksi saat tombol profil diklik
                  },
                ),
              ),
            ),
          ),
        ],
        toolbarHeight: 126, // Mengatur tinggi AppBar
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                'Event List Page',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
