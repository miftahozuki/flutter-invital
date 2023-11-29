// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String instagram;
  final String alamat;
  final String phone_number;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.instagram,
    required this.alamat,
    required this.phone_number,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      name: json['user']['name'],
      username: json['user']['username'],
      email: json['user']['email'],
      instagram: json['user']['instagram'],
      alamat: json['user']['alamat'],
      phone_number: json['user']['phone_number']
    );
  }

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      instagram: json['instagram'],
      alamat: json['alamat'],
      phone_number: json['phone_number']
      // Add more properties if necessary
    );
  }

   // Metode toMap untuk mengonversi objek User ke dalam Map
   Map<String, dynamic> toMap() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'instagram': instagram,
      'alamat': alamat,
      'phone_number': phone_number,
    };
  }

}
