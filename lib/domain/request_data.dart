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

  UserRequest({
    this.name,
    this.number,
    this.gender,
    this.image,
    this.dob,
    this.uid,
    this.u_uid,
    this.request_id,
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
    );
  }
}
