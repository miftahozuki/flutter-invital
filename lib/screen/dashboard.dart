import 'package:flutter/material.dart';
import 'package:plj/models/visitor.dart';
// route to page
import 'package:plj/screen/about_page.dart';
import 'package:plj/screen/event_page.dart';
import 'package:plj/screen/profile_page.dart';
import 'package:plj/screen/scanner_page.dart';
import 'package:plj/screen/visitor_page.dart';
// ekspor style
import 'package:plj/theme.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        title: Center(
          child: Text(
            'Dashboard',
            style: whiteTextStyle.copyWith(
              fontSize: 28,
            ),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(
              right: 30,
            ), // Tambahkan margin sebesar 30
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                shape: const CircleBorder(),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProfilePage();
                      }));// Tambahkan aksi saat tombol profil diklik
                  },
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/images/photo.png'), // Ganti dengan path gambar Anda
                    radius: 15, // Sesuaikan radius dengan kebutuhan
                  ),
                ),
              ),
            ),
          ),
        ],
        toolbarHeight: 80, // Mengatur tinggi AppBar
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/dashboard.png',
                  height: 240,
                ),
                const SizedBox(
                  height: 40,
                ),
                Wrap(
                  spacing: 62,
                  runSpacing: 54,
                  children: [
                    _buildImageWithText('assets/images/events.png', 'Events',
                        () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const EventPage(); // Ganti dengan halaman Events Anda
                      }));
                    }),
                    _buildImageWithText('assets/images/visitor.png', 'Visitor',
                        () {
                          // getVisitor();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return VisitorPage();
                      }));
                      
                    }),
                    _buildImageWithText('assets/images/about.png', 'About', () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const AboutPage(); // Ganti dengan halaman Events Anda
                      }));
                    }),
                    _buildImageWithText('assets/images/sacnner.png', 'Scanner',
                        () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ScannerPage();
                      }));
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageWithText(String imagePath, String text,
      [VoidCallback? onTap]) {
    return InkWell(
      onTap: onTap, // Aksi yang dijalankan saat item diklik (opsional)
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 120,
          ),
          const SizedBox(height: 10),
          Text(text,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              )),
        ],
      ),
    );
  }
}
