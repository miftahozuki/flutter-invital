import 'package:flutter/material.dart';
import 'package:plj/screen/about_page.dart';
import 'package:plj/screen/login_page.dart';
import 'package:plj/screen/update_profile.dart';
import 'package:plj/theme.dart';
import 'package:plj/models/user.dart';
import 'package:plj/database/userDB.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<User> getUser() async {
    final SQLiteDbProvider dbProvider = SQLiteDbProvider.db;
    await dbProvider.initDB();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userid = prefs.getInt('UserID');
    final user = await dbProvider.getUserById(userid);
    User userDetail = new User.fromMap(user);
    return userDetail;
  }

  Future<void> rmUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('UserID');
    print("menghapus user login");
  }

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
      body: FutureBuilder<User>(
        future: getUser(), // Replace with your actual asynchronous function
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While the future is still running, show a loading indicator
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // If there is an error, display an error message
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            // If the future is completed successfully, display the user information
            User user = snapshot.data!;
            return SingleChildScrollView(
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
                          'assets/images/user.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      user.name, // Display user's name
                      style: blackTextStyle.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '@${user.username}', // Display user's name
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Email : ${user.email}', // Display user's name
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Instagram : ${user.instagram}', // Display user's name
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Alamat : ${user.alamat}', // Display user's name
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Phone : ${user.phone_number}', // Display user's name
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    // Add more Text widgets to display other user information as needed
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return UpdateProfilePage();
                          }));
                          // Handle button press
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          side: BorderSide.none,
                          shape: const StadiumBorder(),
                        ),
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
                    // ... rest of your code remains unchanged
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
                          rmUser();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }));
                        }),
                  ],
                ),
              ),
            );
          } else {
            // Handle other cases if needed
            return Text('Unexpected state');
          }
        },
      ),
    );
  }
}
