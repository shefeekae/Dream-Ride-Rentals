class UserModel {
  UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.answer,
  });

  String name;
  String email;
  String phoneNumber;
  String password;
  String answer;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "answer": answer,
      };
}
