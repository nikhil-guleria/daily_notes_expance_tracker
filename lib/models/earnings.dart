class Earnings{
  String? email;
  String? source;
  String? earn;
  String? date;
  Earnings({ this.email, this.source, this.earn, this.date});
  Map<String, dynamic> toMap() {
    return {'email': email,
      'source': source,
      'earn': earn,
      'date': date};
  }
  Earnings.fromMap(Map<String, dynamic> data) {
    email = data['email'];
    source = data['source'];
    earn = data['earn'];
    date = data['date'];
  }

}