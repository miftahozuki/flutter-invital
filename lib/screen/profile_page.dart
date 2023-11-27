import 'package:flutter/material.dart';
import 'package:plj/screen/about_page.dart';
import 'package:plj/screen/login_page.dart';
import 'package:plj/screen/update_profile.dart';
import 'package:plj/theme.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Center(
          child: Text(
            'Halaman Profil',
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
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/images/profile.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Zulfikar Kahfi',
                style: blackTextStyle.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              Text(
                'kahfi@gmail.com',
                style: blackTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return UpdateProfilePage();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: Text(
                    'Edit Profile',
                    style: whiteTextStyle,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),

              //MENU
              /*About App */
              ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: secondaryColor.withOpacity(0.3),
                    ),
                    child: Icon(
                      LineAwesomeIcons.info_circle,
                      color: strokeColor,
                    ),
                  ),
                  title: Text(
                    'About App',
                    style: blackTextStyle,
                  ),
                  trailing: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: strokeColor.withOpacity(0.3),
                    ),
                    child: Icon(
                      LineAwesomeIcons.angle_right,
                      size: 18.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AboutPage();
                    }));
                  }),
              /*About App */
              ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: secondaryColor.withOpacity(0.3),
                    ),
                    child: Icon(
                      LineAwesomeIcons.alternate_sign_out,
                      color: strokeColor,
                    ),
                  ),
                  title: Text(
                    'Logout',
                    style: redTextStyle,
                  ),
                  trailing: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: strokeColor.withOpacity(0.3),
                    ),
                    child: Icon(
                      LineAwesomeIcons.angle_right,
                      size: 18.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
