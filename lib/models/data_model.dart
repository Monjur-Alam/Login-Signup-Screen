import 'package:flutter/cupertino.dart';

class DataModel {
  String name;
  String dep;
  String mobile;
  String blood;
  String fb;
  String identity;
  String status;
  String password;

  DataModel(this.name, this.dep, this.mobile, this.blood, this.fb,
      this.identity, this.status, this.password);

  Map<String, dynamic> toJson() {
    return {
      "name" : name,
      "dep" : dep,
      "mobile" : mobile,
      "blood" : blood,
      "fb" : fb,
      "identity" : identity,
      "status" : status,
      "password" : password
    };
  }
}