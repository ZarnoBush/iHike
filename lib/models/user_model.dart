class UserModel {
  String? id;
  String? fullname;
  String? contact;
  String? gender;
  String? password;

  UserModel(
      {  
       required this.id, 
      required this.fullname,
      required this.contact,
      required this.gender,
      required this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        fullname: json['fullname'],
        contact: json['contact'],
        gender: json['gender'],
        password: json['password']);
  }
}
