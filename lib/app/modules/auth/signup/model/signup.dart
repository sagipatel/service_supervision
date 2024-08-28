// To parse this JSON data, do
//
//     final signup = signupFromJson(jsonString);

import 'dart:convert';
SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());


class SignupModel {
  var statusCode;
  var message;
  SignUpData? data;

  SignupModel({
    this.statusCode,
    this.message,
    this.data,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
    statusCode: json["statusCode"],
    message: json["message"],
    data: SignUpData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": data!.toJson(),
  };
}

class SignUpData {
  var id;
  var otp;
  var token;
  var stage;

  SignUpData({
    this.id,
    this.otp,
    this.token,
    this.stage,
  });

  factory SignUpData.fromJson(Map<String, dynamic> json) => SignUpData(
    id: json["id"],
    otp: json["otp"],
    token: json["token"],
    stage: json["stage"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "otp": otp,
    "token": token,
    "stage": stage,
  };
}
