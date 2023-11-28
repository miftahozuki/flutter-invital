import 'package:flutter/material.dart';
import 'package:plj/theme.dart';
import 'package:plj/widgets/akad_card.dart';
import 'package:plj/widgets/husband_card.dart';
import 'package:plj/widgets/resepsi_card.dart';
import 'package:plj/widgets/wife_card.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mempelai Pria / Suami',
                style: blackTextStyle,
              ),
              SizedBox(
                height: 10,
              ),
              HusbandCard(),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: grayColor, // Sesuaikan warna garis dengan desain Anda
                thickness: 2, // Sesuaikan ketebalan garis dengan desain Anda
                height: 20, // Sesuaikan tinggi garis dengan desain Anda
              ),
              Text(
                'Mempelai Wanita / Istri',
                style: blackTextStyle,
              ),
              SizedBox(
                height: 10,
              ),
              WifeCard(),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: grayColor, // Sesuaikan warna garis dengan desain Anda
                thickness: 2, // Sesuaikan ketebalan garis dengan desain Anda
                height: 20, // Sesuaikan tinggi garis dengan desain Anda
              ),
              Text(
                'Acara Akad',
                style: blackTextStyle,
              ),
              SizedBox(
                height: 10,
              ),
              AkadCard(),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: grayColor, // Sesuaikan warna garis dengan desain Anda
                thickness: 2, // Sesuaikan ketebalan garis dengan desain Anda
                height: 20, // Sesuaikan tinggi garis dengan desain Anda
              ),
              Text(
                'Acara Resepsi',
                style: blackTextStyle,
              ),
              SizedBox(
                height: 10,
              ),
              ResepsiCard(),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: grayColor, // Sesuaikan warna garis dengan desain Anda
                thickness: 2, // Sesuaikan ketebalan garis dengan desain Anda
                height: 20, // Sesuaikan tinggi garis dengan desain Anda
              ),

              SizedBox(
                height: 20,
              ),

              // -- Form Tambah Tamu
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  // => Get.to(() => const UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: secondaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: Text('Tambah Tamu Yang Akan Hadir',
                      style: blackTextStyle),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              // -- Form Cetak Daftar Tamu
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  // => Get.to(() => const UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: secondaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: Text('Cetak Daftar Tamu Yang Hadir',
                      style: blackTextStyle),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              // -- Form Cetak Undangan
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  // => Get.to(() => const UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: secondaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: Text('Cetak Undangan', style: blackTextStyle),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
