import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:plj/screen/dashboard.dart';
import 'package:plj/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UpdateProfilePage extends StatelessWidget {
  UpdateProfilePage({super.key});
  final _formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  Future<void> updateProfile() async {
    String urlEndPoint =
        "https://invitation-digital.tifint.myhost.id/api/users/";
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userid = prefs.getInt('UserID');
    print(userid);

    Map<String, String> queryParams = {
      'name': fullNameController.text,
      'username': usernameController.text,
      'email': emailController.text,
      'instagram': instagramController.text,
      'alamat': alamatController.text,
      'phone_number': phoneNumberController.text,
    };

    String queryString = Uri(queryParameters: queryParams).query;
    String requestUrl =
        urlEndPoint + '${prefs.getInt('UserID')}?' + queryString;

    final response = await http.put(Uri.parse(requestUrl));
    Map<String, dynamic> data = json.decode(response.body);

    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Center(
          child: Text(
            'Update Profile',
            style: whiteTextStyle.copyWith(fontSize: 28),
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
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // -- IMAGE with ICON
              Stack(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/images/user.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                  /** */
                  /*Edit Foto Button*/
                  /** */
                  // Positioned(
                  //   bottom: 0,
                  //   right: 0,
                  //   child: Container(
                  //     width: 35,
                  //     height: 35,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(100),
                  //         color: primaryColor),
                  //     child: const Icon(LineAwesomeIcons.camera,
                  //         color: Colors.black, size: 20),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 50),

              // -- Form Fields
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text('Full Name'),
                          prefixIcon: Icon(LineAwesomeIcons.user)),
                      controller: fullNameController,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text('Username'),
                          prefixIcon: Icon(LineAwesomeIcons.user)),
                      controller: usernameController,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text('Email'),
                          prefixIcon: Icon(LineAwesomeIcons.envelope_1)),
                      controller: emailController,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text('Instagram'),
                          prefixIcon: Icon(LineAwesomeIcons.instagram)),
                      controller: instagramController,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text('Alamat'),
                          prefixIcon: Icon(LineAwesomeIcons.address_book)),
                      controller: alamatController,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text('Phone Number'),
                          prefixIcon: Icon(LineAwesomeIcons.phone)),
                      controller: phoneNumberController,
                      keyboardType: TextInputType.number,
                    ),
                    // const SizedBox(height: 20),
                    // TextFormField(
                    //   obscureText: true,
                    //   decoration: InputDecoration(
                    //     label: const Text('Password'),
                    //     prefixIcon: const Icon(Icons.fingerprint),
                    //     suffixIcon: IconButton(
                    //         icon: const Icon(LineAwesomeIcons.eye_slash),
                    //         onPressed: () {}),
                    //   ),
                    // ),
                    const SizedBox(height: 40),

                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          updateProfile();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DashboardPage(),
                            ),
                          );
                        },
                        // => Get.to(() => const UpdateProfileScreen()),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: Text('Edit Profile', style: blackTextStyle),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // -- Created Date and Delete Button
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     const Text.rich(
                    //       TextSpan(
                    //         text: tJoined,
                    //         style: TextStyle(fontSize: 12),
                    //         children: [
                    //           TextSpan(
                    //               text: tJoinedAt,
                    //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))
                    //         ],
                    //       ),
                    //     ),
                    //     ElevatedButton(
                    //       onPressed: () {},
                    //       style: ElevatedButton.styleFrom(
                    //           backgroundColor: Colors.redAccent.withOpacity(0.1),
                    //           elevation: 0,
                    //           foregroundColor: Colors.red,
                    //           shape: const StadiumBorder(),
                    //           side: BorderSide.none),
                    //       child: const Text(tDelete),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
