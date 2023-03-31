class User {
  User({
    required this.pic,
    required this.isAdmin,
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.answer,
    required this.access,
    required this.v,
    this.token,
  });

  String pic;
  bool isAdmin;
  String id;
  String name;
  String email;
  String password;
  int phoneNumber;
  String answer;
  bool access;
  int v;
  String? token;

  factory User.fromJson(Map<String, dynamic> json, [String? token]) => User(
        pic: json["pic"],
        isAdmin: json["isAdmin"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        answer: json["answer"],
        access: json["access"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "pic": pic,
        "isAdmin": isAdmin,
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
        "answer": answer,
        "access": access,
        "__v": v,
        "token": token,
      };
}
