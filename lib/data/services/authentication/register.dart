class Register {
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? confirmPassword;

  Register(
      {this.firstname,
      this.lastname,
      this.email,
      this.password,
      this.confirmPassword});

  Register.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    return data;
  }
}
