class UserModel {
  final String fullName;
  final String email;
  final String? profileImageUrl;

  UserModel({
    required this.fullName,
    required this.email,
    this.profileImageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'profileImageUrl': profileImageUrl,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'],
      email: json['email'],
      profileImageUrl: json['profileImageUrl'],
    );
  }
}
