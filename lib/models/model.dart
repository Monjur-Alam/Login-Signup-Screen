class Model {
  String mobile;
  String password;

  Model(this.mobile, this.password);

  Map<String, dynamic> toJson() {
    return {
      "mobile" : mobile,
      "password" : password
    };
  }
}
