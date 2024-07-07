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
  String? rideid;
  String? expence;
  String? fromuid;

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
    this.rideid,
    this.expence,
    this.fromuid,
  });

  factory RidePublish.fromJson(Map<String, dynamic> json) {
    return RidePublish(
      rideid: json['ride_id'],
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
      fromuid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> publish = {
      'ride_id': this.rideid,
      'pickup_location': this.pickuplocation,
      'drop_location': this.dropitlocation,
      'middlecity': this.middlecity,
      'pickup_time': this.time,
      'pickupdate': this.date,
      'passenger_count': this.passengercount,
      'pick_latitude': this.picklatitude,
      'pick_longitude': this.picklongitude,
      'drop_latitude': this.droplatitude,
      'drop_longitude': this.droplongitude,
      'travel_expense': this.expence
      
    };
    return publish;
  }
}
