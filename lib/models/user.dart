// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String name;
  final String username;
  final String email;
  final String phone;

  User({
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['user']['name'],
      username: json['user']['username'],
      email: json['user']['email'],
      phone: json['user']['email']
    );
  }

}
