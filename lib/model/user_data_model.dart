import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataModel{
  String? name;
  String? phoneNumber;
  String? image;
  Timestamp? time;
  UserDataModel({
    this.name,
    this.phoneNumber,
    this.image,
    this.time
  });
  factory UserDataModel.fromJson(Map<String,dynamic> json){
    return UserDataModel(
      name: json['name'],
      phoneNumber: json['phone_number'],
      image: json['image'],
      time: json['time']
    );
  }
  Map<String,dynamic>toJson(){
    return {
      'name':name,
      'phone_number':phoneNumber,
      'image':image,
      'time':time
    };
  }
}