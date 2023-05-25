class Users{
  String? email;
  String? name;
  String? phone;
  String? password;
  String? image ;
  Users({ this.email, this.name, this.password,this.phone,this.image});
  Map<String, dynamic> toMap() {
    return {'email': email,
      'username': name,
      'password': password,
      'phone' : phone,
      'image': image };
  }
  Users.fromMap(Map<String, dynamic> data) {
    email = data['email'];
    name = data['username'];
    password = data['password'];
    phone = data['phone'];
    image = data['image'];
  }

}