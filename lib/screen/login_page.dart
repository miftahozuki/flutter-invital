import 'package:flutter/material.dart';

import '../theme.dart';
import 'dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isUsernameFocused = false;
  bool isPasswordFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/bg_login.png',
              width: MediaQuery.of(context).size.width,
              height: 932,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                const SizedBox(
                  height: 120,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/login_logo.png',
                        height: 200,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 246,
                  width: MediaQuery.of(context).size.width - (2 * 2),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(40),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: isUsernameFocused
                                    ? primaryColor
                                    : const Color(0xff8c8c8c),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: isUsernameFocused
                                  ? primaryColor
                                  : const Color(0xff8c8c8c),
                            ),
                            labelText: 'Username',
                            labelStyle: TextStyle(
                              color: isUsernameFocused
                                  ? primaryColor
                                  : const Color(0xff8c8c8c),
                            ),
                          ),
                          cursorColor: primaryColor,
                          onTap: () {
                            setState(() {
                              isUsernameFocused = true;
                            });
                          },
                          onEditingComplete: () {
                            setState(() {
                              isUsernameFocused = false;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: isPasswordFocused
                                  ? primaryColor
                                  : const Color(0xff8c8c8c),
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: isPasswordFocused
                                  ? primaryColor
                                  : const Color(0xff8c8c8c),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: isPasswordFocused
                                    ? primaryColor
                                    : const Color(0xff8c8c8c),
                              ),
                            ),
                          ),
                          cursorColor: primaryColor,
                          onTap: () {
                            setState(() {
                              isPasswordFocused = true;
                            });
                          },
                          onEditingComplete: () {
                            setState(() {
                              isPasswordFocused = false;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              // Tambahkan logika untuk tindakan login di sini
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DashboardPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: secondaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: Text(
                              'Login',
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
