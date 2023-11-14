class User {
  dynamic id;
  String email;
  String name;
  String avatar;
  String gender;
  String describe;
  String job;
  String password;

  User(
      {required this.id,
      required this.email,
      required this.name,
      required this.avatar,
      required this.gender,
      required this.describe,
      required this.job,
      required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? "",
      email: json['email'] ?? "",
      name: json['name'] ?? "",
      avatar: json['avatar'] ?? "",
      gender: json['gender'] ?? "",
      describe: json['describe'] ?? "",
      job: json['job'] ?? "",
      password: json['password'] ?? "",
    );
  }

  //Hàm chuyển đổi sang map để push lên firebase firestore
  Map<String, dynamic> UserJson() => {
    'id': id,
    'email': email,
    'name': name,
    'avatar': avatar,
    'gender': gender,
    'describe': describe,
    'job': job,
    'password': password,
  };
}
