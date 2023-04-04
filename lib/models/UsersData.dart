class Users{
  String? email;
  String? name;
  String? phone;
  String? password;
  Users({ this.email, this.name, this.password,this.phone});
  Map<String, dynamic> toMap() {
    return {'email': email,
      'username': name,
      'password': password,
      'phone' : phone};
  }
  Users.fromMap(Map<String, dynamic> data) {
    email = data['email'];
    name = data['username'];
    password = data['password'];
    phone = data['phone'];
  }

}