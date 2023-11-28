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
              right: 50,
            ),
          ),
        ],
        toolbarHeight: 80, // Mengatur tinggi AppBar
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),

      /*Body*/
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Invital App',
                  style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Version 1.1.1.1',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 250,
                  child: Image.asset(
                    'assets/images/login_logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '© 2023 PT PCA\nPencari Cinta Abadi',
                  textAlign: TextAlign.center,
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    //
                  },
                  child: Text(
                    'CONTACT US',
                    style: blackTextStyle.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
