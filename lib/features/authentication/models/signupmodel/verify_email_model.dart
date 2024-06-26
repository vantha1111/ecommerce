class VerifyEmailModel {
  String? email;
  String? verificationCode;

  VerifyEmailModel({this.email, this.verificationCode});

  VerifyEmailModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    verificationCode = json['verificationCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['verificationCode'] = this.verificationCode;
    return data;
  }
}
