import 'package:flutter/material.dart';
import 'package:plj/widgets/visitor_card.dart';
import 'package:plj/models/visitor.dart';

import '../theme.dart';

class VisitorPage extends StatelessWidget {
  const VisitorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Center(
          child: Text(
            'Daftar Tamu',
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
                VisitorCard(
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
                VisitorCard(
                  Visitor(
                    id: 1,
                    name: 'Miftahus Surur Sutowo',
                    gender: 'Laki-laki',
                    address: 'Situbondo',
                    visitor_status: 'VIP',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                VisitorCard(
                  Visitor(
                    id: 1,
                    name: 'Iwangn Pradipta Dinoto',
                    gender: 'Laki-laki',
                    address: 'Sumenep',
                    visitor_status: 'VIP',
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
