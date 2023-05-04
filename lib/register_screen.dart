class UserModel{
  String? uid;
  String? name;
  String? email;
  String? phone;

  UserModel({this.uid,this.name,this.email,this.phone});

  // Receive data from server.
  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      phone: map['phone']
    );
  }

  // Send data to our server.
  Map<String, dynamic> toMap(){
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'phone': phone

    };
  }

}