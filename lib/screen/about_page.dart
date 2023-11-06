import 'package:flutter/material.dart';
import 'package:plj/theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Center(
          child: Text(
            'About',
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
              Container(
                width: 240, // Sesuaikan lebar container dengan gambar
                height: 240, // Sesuaikan tinggi container dengan gambar
                decoration: BoxDecoration(
                  color: primaryColor, // Warna latar belakang container
                  borderRadius: BorderRadius.circular(
                      20), // Bentuk bulatan sesuai keinginan Anda
                ),
                child: Image.asset(
                  'assets/images/about2.png',
                  height: 240,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
