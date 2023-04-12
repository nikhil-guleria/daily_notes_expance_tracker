class Activity{
  String? email;
  String? activity;
  String? note;
  String? date;
  Activity({ this.email, this.activity, this.note, this.date});
  Map<String, dynamic> toMap() {
    return {'email': email,
      'activity': activity,
      'note': note,
      'date': date};
  }
  Activity.fromMap(Map<String, dynamic> data) {
    email = data['email'];
    activity = data['activity'];
    note = data['note'];
    date = data['date'];
  }

}