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
  String? miniBio;
  String? chat;
  String? song;
  String? smoke;
  String? pet;
  String? vNumber;
  String? vmodel;
  String? vbrand;
  String? vcolor;
  String? vtype;
  // String? pickuplocation;
  // String? dropitlocation;
  // String? middlecity;
  // String? time;
  // String? date;
  // String? passengercount;

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
      this.password,
      this.miniBio,
      this.chat,
      this.song,
      this.smoke,
      this.pet,
      this.vNumber,
      this.vmodel,
      this.vbrand,
      this.vcolor,
      this.vtype,
    //   this.pickuplocation,
    //   this.dropitlocation,
    // this.middlecity,
    // this.time,
    // this.date,
    // this.passengercount,
      });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      gender: json['Gender'] ??"null",
      number: json['number']??"null",
      name: json['Name']??"null",
      email: json['Email']??"null",
      uid: json['uid']??"null",
      image: json['image']??"null",
      street: json['street']??"null",
      city: json['city']??"null",
      district: json['district']??"null",
      dob: json['dob']??"null", 
      miniBio: json['miniBio']??"null",
      chat: json['chat']??"null",
      song: json['song']??"null",
      smoke: json['smoke']??"null",
      pet: json['pet']??"null",
      vNumber: json['vnumber']??"null",
      vmodel: json['vmodel']??"null",
      vbrand: json['vbrand']??"null",
      vcolor: json['vcolor']??"null",
      vtype: json['vtype']??"null",
      // pickuplocation: json['pickup'],
      // dropitlocation: json['dropit'],
      // middlecity: json['middlecity'],
      // time: json['pickup_time'],
      // date: json['pickupdate'],
      // passengercount: json['passenger_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Name'] = this.name;
    data['Email'] = this.email;
      data['uid'] = this.uid;
    data['image'] = this.image;
    data['Gender'] = this.gender;
    data['number'] = this.number;
    data['street'] = this.street;
    data['city'] = this.city;
    data['district'] = this.district;
    data['dob'] = this.dob;
    data['miniBio'] = this.miniBio;
    data['chat'] = this.chat;
    data['song'] = this.song;
    data['smoke'] = this.smoke;
    data['pet'] = this.pet;
    data['vnumber'] = this.vNumber;
    data['vmodel'] = this.vmodel;
    data['vbrand'] = this.vbrand;
    data['vcolor'] = this.vcolor;
    data['vtype'] = this.vtype;
    // data['pickup'] = this.pickuplocation;
    // data['dropit'] = this.dropitlocation;
    // data['middlecity'] = this.middlecity;
    // data['pickup_time'] = this.time;
    // data['pickupdate'] = this.date;
    // data['passenger_count'] = this.passengercount;
    
    return data;
  }
}