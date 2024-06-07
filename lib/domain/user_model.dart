// ignore_for_file: prefer_collection_literals, unnecessary_this

class UserModel {
  String? email;
  String? uid;
  String? name;
  String? number;
  String? password;
  String? gender;
  String? street;
  String? city;
  String? district;
  String? image;
  String? dob;

  UserModel(
      {this.email,
      this.uid,
      this.name,
       this.number,
      this.gender,
      this.street,
      this.city,
      this.district,
      this.image,
      this.dob,
      this.password});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      gender: json['Gender'],
      number: json['number'],
      name: json['Name'],
      email: json['Email'],
      uid: json['uid'],
      image: json['profile'],
      street: json['street'],
      city: json['city'],
      district: json['district'],
      dob: json['dob'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['uid'] = this.uid;
    data['profile'] = this.image;
    data['Gender'] = this.gender;
    data['number'] = this.number;
    data['street'] = this.street;
    data['city'] = this.city;
    data['district'] = this.district;
    data['dob'] = this.dob;
    return data;
  }
}
