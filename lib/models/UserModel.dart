class User {
  final String name;
  final String email;
  final String phoneNumber;
  final String avatarUrl;

  User({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.avatarUrl,
  });


factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      avatarUrl: json['avatarUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'avatarUrl' : avatarUrl,
    };
  }
}
