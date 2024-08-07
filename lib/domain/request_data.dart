// domain/request_data.dart
class UserRequest {
  final String? name;
  final String? number;
  final String? gender;
  final String? image;
  final String? dob;
  final String? uid;
  final String? u_uid;
  final String? request_id;
  String? pickuplocation;
  String? picklatitude;
  String? picklongitude;
  String? dropitlocation;
  String? droplatitude;
  String? droplongitude;
  String? middlecity;
  String? time;
  String? date;
  String? passengercount;
  String? expence;
  String? fromuid;
  String? uname;
  String? acceptid;
  String? requestUserId;

  UserRequest({
    this.name,
    this.number,
    this.gender,
    this.image,
    this.dob,
    this.uid,
    this.u_uid,
    this.request_id,
    this.pickuplocation,
    this.picklatitude,
    this.picklongitude,
    this.dropitlocation,
    this.droplatitude,
    this.droplongitude,
    this.middlecity,
    this.time,
    this.date,
    this.passengercount,
    this.expence,
    this.fromuid,
    this.uname,
    this.acceptid,
    this.requestUserId,
  });

  factory UserRequest.fromJson(Map<String, dynamic> json) {
    return UserRequest(
      name: json['Name'],
      number: json['number'],
      gender: json['Gender'],
      image: json['image'],
      dob: json['dob'],
      uid: json['uid'],
      u_uid: json['u_uid'],
      request_id: json['request_id'],
      pickuplocation: json['pickup_location'] ?? "Unknown",
      dropitlocation: json['drop_location'] ?? "Unknown",
      middlecity: json['middlecity'] ?? "Unknown",
      time: json['pickup_time'] ?? "Unknown",
      date: json['pickupdate'] ?? "Unknown",
      passengercount: json['passenger_count'] ?? "Unknown",
      picklatitude: json['pick_latitude'],
      picklongitude: json['pick_longitude'],
      droplatitude: json['drop_latitude'],
      droplongitude: json['drop_longitude'],
      expence: json['travel_expense'],
      fromuid: json['u_uid'],
      uname: json['u_name'],
      acceptid: json['acceptid'],
      requestUserId: json['requestUserId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> request = {
      'uid': uid,
      'pickup_location': pickuplocation,
      'drop_location': dropitlocation,
      'middlecity': middlecity,
      'pickup_time': time,
      'pickupdate': date,
      'passenger_count': passengercount,
      'pick_latitude': picklatitude,
      'pick_longitude': picklongitude,
      'drop_latitude': droplatitude,
      'drop_longitude': droplongitude,
      'travel_expense': expence,
      'acceptid': acceptid,
      'Name': name,
      'number': number,
      'Gender': gender,
      'image': image,
      'dob': dob,
      'u_uid': fromuid,
      'request_id': request_id,
      'requestUserId': requestUserId,
    };
    return request;
  }
}
