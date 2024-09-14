class User {
  final String name;
  final String email;
  final String phoneNumber;
  final String avatarUrl;
  final String dateOfBirth; // Sử dụng String cho ngày sinh
  final String gender; // Sử dụng String cho giới tính

  User({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.avatarUrl,
    required this.dateOfBirth,
    required this.gender,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      avatarUrl: json['avatarUrl'],
      dateOfBirth: json['dateOfBirth'], // Ngày sinh dưới dạng String
      gender: json['gender'], // Giới tính dưới dạng String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'avatarUrl': avatarUrl,
      'dateOfBirth': dateOfBirth, // Ngày sinh dưới dạng String
      'gender': gender, // Giới tính dưới dạng String
    };
  }
}
