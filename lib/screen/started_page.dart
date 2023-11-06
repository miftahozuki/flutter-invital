import 'package:flutter/material.dart';
import 'package:plj/theme.dart';
import 'package:plj/screen/login_page.dart';

class StartedPage extends StatelessWidget {
  const StartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/home_page.png',
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                const SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 410,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: primaryColor,
                  ),
                  child: Column(children: [
                    const SizedBox(
                      height: 37,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 102,
                      ),
                      child: Column(children: [
                        Text(
                          'INVITAL',
                          textAlign: TextAlign.center,
                          style: whiteTextStyle.copyWith(
                            fontSize: 36,
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 35,
                      ),
                      child: Column(children: [
                        Text(
                          'Invitations Digital merupakan solusi modern dan ramah lingkungan untuk mengelola undangan acara Anda, memberikan kemudahan, efisiensi, dan fleksibilitas dalam proses pengiriman undangan.',
                          textAlign: TextAlign.center,
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 65,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to Login Page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Text('Get Started',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    InkWell(
                      onTap: () {
                        //Handle terms & conditions
                      },
                      child: Text(
                        'Terms & Conditions',
                        style: blackTextStyle.copyWith(
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
