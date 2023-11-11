import 'package:flutter/material.dart';


import '../theme.dart';
import 'dashboard.dart';


import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:form_field_validator/form_field_validator.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isUsernameFocused = false;
  bool isPasswordFocused = false;

  Future<void> login() async {
    String email = usernameController.text;
    String password = passwordController.text;
    String urlEndPoint = "http://localhost:8001/api/user/auth/login";

    Map<String, String> queryParams = {
      'username': email,
      'password': password,
    };

    String queryString = Uri(queryParameters: queryParams).query;
    String requestUrl = urlEndPoint + '?' + queryString;

    try {
      final response = await http.get(Uri.parse(requestUrl));
      Map<String, dynamic> data = json.decode(response.body);

      if (data['code'] == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardPage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(data['message']),
        ));
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

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
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: TextFormField(
                              controller: usernameController,
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
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: "Username tidak boleh kosong!"),
                                MinLengthValidator(5,
                                    errorText:
                                        "username harus lebih dari 5 karakter")
                              ]),
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
                            child: TextFormField(
                              controller: passwordController,
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
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: "Password tidak boleh kosong!"),
                                MinLengthValidator(5,
                                    errorText:
                                        "Password harus lebih dari 5 karakter")
                              ]),
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
                                  if (_formKey.currentState!.validate()) {
                                    // Jika validasi berhasil, lakukan tindakan yang diinginkan
                                    login();
                                  }
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
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
