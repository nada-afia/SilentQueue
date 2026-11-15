class UserModel {
  final String fullName;
  final String email;
  final String password;
  final String? profileImageUrl;

  UserModel({
    required this.fullName,
    required this.email,
    required this.password,
    this.profileImageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'password': password,
      'profileImageUrl': profileImageUrl,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'],
      email: json['email'],
      password: json['password'],
      profileImageUrl: json['profileImageUrl'],
    );
  }
}
