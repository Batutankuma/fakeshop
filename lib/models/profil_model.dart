class ProfilModel {
  final String id;
  final String username;
  final String email;
  final String avatar;
  final String role;

  ProfilModel(
      {required this.id,
      required this.username,
      required this.email,
      required this.avatar,
      required this.role});

  factory ProfilModel.fromJson(Map<String, dynamic> json) {
    return ProfilModel(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        avatar: json['avatar'],
        role: "ssss");
  }
}
