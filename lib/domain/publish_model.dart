class RidePublish {
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
  String? uid;
  String? expence;
  String? fromuid;
  String? uname;
 

  RidePublish({
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
    this.uid,
    this.expence,
    this.fromuid,
    this.uname,
 
  });

  factory RidePublish.fromJson(Map<String, dynamic> json) {
    return RidePublish(
      uid: json['uid'],
      pickuplocation: json['pickup_location'] ?? "Unknown",
      dropitlocation: json['drop_location'] ?? "Unknown",
      middlecity: json['middlecity'] ?? "Unknown",
      time: json['pickup_time'] ?? "Unknown",
      date: json['pickupdate'] ?? "Unknown",
      passengercount: json['passenger_count'] ?? "Unknown",
      picklatitude: json['picklatitude'],
      picklongitude: json['picklongitude'],
      droplatitude: json['droplatitude'],
      droplongitude: json['droplongitude'],
      expence: json['travel_expense'],
      fromuid: json['u_uid'],
      uname: json['u_name'],
   
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> publish = {
      'uid': uid,
      'pickup_location': pickuplocation,
      'drop_location': dropitlocation,
      'middlecity': middlecity,
      'pickup_time': time,
      'pickupdate': date,
      'passenger_count': passengercount,
      'picklatitude': picklatitude,
      'picklongitude': picklongitude,
      'droplatitude': droplatitude,
      'droplongitude': droplongitude,
      'travel_expense': expence,
    };
    return publish;
  }
}
