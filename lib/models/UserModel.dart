class User {
  final String name;
  final String email;
  final String? phoneNumber;

  User({required this.name, required this.email, this.phoneNumber});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
