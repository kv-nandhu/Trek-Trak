class UserModel {
  String? email;
  String? uid;
  String? name;
  String? phone;
  String? password;
  String? gender;
  String? street;
  String? city;
  String? district;
  String? image;

  UserModel(
      {this.email,
      this.uid,
      this.name,
      this.phone,
      this.gender,
      this.street,
      this.city,
      this.district,
      this.image,
      this.password});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      gender: json['Gender'],
      phone: json['phone'],
      name: json['Name'],
      email: json['Email'],
      uid: json['uid'],
      image: json['profile'],
      street: json['street'],
      city: json['city'],
      district: json['district'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['uid'] = this.uid;
    data['profile'] = this.image;
    data['Gender'] = this.gender;
    data['phone'] = this.phone;
    data['street'] = this.street;
    data['city'] = this.city;
    data['district'] = this.district;
    return data;
  }
}
