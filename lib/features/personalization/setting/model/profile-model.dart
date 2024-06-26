class User {
  String? id;
  String? firstname;
  String? email;
  String? profileImageUrl;

  User({this.id, this.firstname, this.email, this.profileImageUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    email = json['email'];
    profileImageUrl = json['profileImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['email'] = this.email;
    data['profileImageUrl'] = this.profileImageUrl;
    return data;
  }
}
