class RideAccepted {
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
  String? acceptid;
  String? requestUserId;
  String? image;
  String? userName;
  String? userImage;
  
  final bool? isRead;

 

  RideAccepted({
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
    this.acceptid,
    this.requestUserId,
    this.image,
    this.userName,
    this.userImage,
   this.isRead,
 
  });

  factory RideAccepted.fromJson(Map<String, dynamic> json) {
    return RideAccepted(
      uid: json['uid'],
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
      requestUserId: json['request_user_id'],
      image: json['image'],
      userImage: json['userimage'],
      userName: json['Name'],
      isRead: json['isRead'] as bool? ?? false,
   
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> rideAccepted = {
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
      'request_user_id': requestUserId,
      'image': image,
      'u_name':uname,
      'Name':userName,
      'userimage':userImage,
      'isRead':isRead
    };
    return rideAccepted;
  }
}
