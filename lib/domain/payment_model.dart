class Payment {
  String? paymentId;
  String? userId;
  String? rideUserId;
  String? name;
  String? rideUserName;
  String? expence;


Payment({
  
this.name, this.paymentId, this.rideUserId, this.rideUserName,this.userId,this.expence
});

factory Payment.fromJson(Map<String, dynamic> json) {
  return  Payment(
    name: json['name'],
    paymentId: json['payment_id'],
    rideUserId: json['ride_user_id'],
    rideUserName: json['ride_user_name'],
    userId: json['user_id'],
    expence: json['expence'],
  );

}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> payments = {
    'name': name,
    'payment_id':paymentId, 'ride_user_id':rideUserId,
    'ride_user_name': rideUserName, 
    'user_id':userId,
    'expence':expence,
  };
  return payments;
}
}