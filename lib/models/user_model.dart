class UserModel {
  final String fullName;
  final String nickname;
  final String email;
  final String phone;
  final String gender;
  final String country;
  final String? imagePath;

  const UserModel({
    required this.fullName,
    required this.nickname,
    required this.email,
    required this.phone,
    required this.gender,
    required this.country,
    this.imagePath,
  });

  UserModel copyWith({
    String? fullName,
    String? nickname,
    String? email,
    String? phone,
    String? gender,
    String? country,
    String? imagePath,
  }) {
    return UserModel(
      fullName: fullName ?? this.fullName,
      nickname: nickname ?? this.nickname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
