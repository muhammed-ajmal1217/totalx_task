class UserDataModel{
  String? name;
  String? phoneNumber;
  String? image;
  UserDataModel({
    this.name,
    this.phoneNumber,
    this.image
  });
  factory UserDataModel.fromJson(Map<String,dynamic> json){
    return UserDataModel(
      name: json['name'],
      phoneNumber: json['phone_number'],
      image: json['image'],
    );
  }
  Map<String,dynamic>toJson(){
    return {
      'name':name,
      'phone_number':phoneNumber,
      'image':image
    };
  }
}