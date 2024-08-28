// To parse this JSON data, do
//
//     final verifyOtpModel = verifyOtpModelFromJson(jsonString);

import 'dart:convert';

VerifyOtpModel verifyOtpModelFromJson(String str) => VerifyOtpModel.fromJson(json.decode(str));

String verifyOtpModelToJson(VerifyOtpModel data) => json.encode(data.toJson());

class VerifyOtpModel {
  var statusCode;
  var message;
  VerifyOtpData? data;

  VerifyOtpModel({
    this.statusCode,
    this.message,
    this.data,
  });

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) => VerifyOtpModel(
    statusCode: json["statusCode"],
    message: json["message"],
    data: VerifyOtpData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": data!.toJson(),
  };
}

class VerifyOtpData {
  var id;
  var fullName;
  var mobileNumber;
  var uniqueId;
  var email;
  var gstNumber;
  var alternateNumber;
  var city;
  var state;
  var bsName;
  var bsType;
  var planId;
  var address;
  var pinCode;
  var type;
  var passCode;
  var parentId;
  var otpVerify;
  var profileImage;
  var isForget;
  var token;
  var stage;
  var isActive;
  var createdAt;
  var updatedAt;
  var deletedAt;

  VerifyOtpData({
    this.id,
    this.fullName,
    this.mobileNumber,
    this.uniqueId,
    this.email,
    this.gstNumber,
    this.alternateNumber,
    this.city,
    this.state,
    this.bsName,
    this.bsType,
    this.planId,
    this.address,
    this.pinCode,
    this.type,
    this.passCode,
    this.parentId,
    this.otpVerify,
    this.profileImage,
    this.isForget,
    this.token,
    this.stage,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory VerifyOtpData.fromJson(Map<String, dynamic> json) => VerifyOtpData(
    id: json["id"],
    fullName: json["full_name"],
    mobileNumber: json["mobile_number"],
    uniqueId: json["unique_id"],
    email: json["email"],
    gstNumber: json["gst_number"],
    alternateNumber: json["alternate_number"],
    city: json["city"],
    state: json["state"],
    bsName: json["bs_name"],
    bsType: json["bs_type"],
    planId: json["plan_id"],
    address: json["address"],
    pinCode: json["pin_code"],
    type: json["type"],
    passCode: json["pass_code"],
    parentId: json["parent_id"],
    otpVerify: json["otp_verify"],
    profileImage: json["profile_image"],
    isForget: json["is_forget"],
    token: json["token"],
    stage: json["stage"],
    isActive: json["is_active"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "mobile_number": mobileNumber,
    "unique_id": uniqueId,
    "email": email,
    "gst_number": gstNumber,
    "alternate_number": alternateNumber,
    "city": city,
    "state": state,
    "bs_name": bsName,
    "bs_type": bsType,
    "plan_id": planId,
    "address": address,
    "pin_code": pinCode,
    "type": type,
    "pass_code": passCode,
    "parent_id": parentId,
    "otp_verify": otpVerify,
    "profile_image": profileImage,
    "is_forget": isForget,
    "token": token,
    "stage": stage,
    "is_active": isActive,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}
