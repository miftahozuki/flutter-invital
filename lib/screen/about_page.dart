import 'package:flutter/material.dart';
import '../theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key});

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
            margin: const EdgeInsets.only(
              right: 30,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                shape: const CircleBorder(),
                child: InkWell(
                  onTap: () {
                    // Tambahkan aksi saat tombol profil diklik
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

      /*Body*/
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 30,
              ),
              child: Container(
                height: 600,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: whiteColor,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/about2.png',
                            width: 350,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: 340,
                              width: 350,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: brownColor,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'INVITAL',
                                      style: blackTextStyle.copyWith(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Invitations Digital merupakan solusi modern dan ramah lingkungan untuk mengelola undangan acara Anda, memberikan kemudahan, efisiensi, dan fleksibilitas dalam proses pengiriman undangan',
                                      style: blackTextStyle.copyWith(
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 80,
              right: 80,
              bottom: 5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'BACK',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
