enum UserType { PARTICULAR, PROFESSIONAL }

class User {
  User({
    this.id,
    this.nickname,
    this.email,
    this.phone,
    this.password,
    this.type = UserType.PARTICULAR,
  });

  String id;
  String nickname;
  String email;
  String phone;
  String password;
  UserType type;
  DateTime createdAt;
}
