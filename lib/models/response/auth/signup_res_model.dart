// To parse this JSON data, do
//
//     final signupResponseModel = signupResponseModelFromJson(jsonString);

import 'dart:convert';

SignupResponseModel signupResponseModelFromJson(String str) => SignupResponseModel.fromJson(json.decode(str));

String signupResponseModelToJson(SignupResponseModel data) => json.encode(data.toJson());

class SignupResponseModel {
  String firstName;
  String lastName;
  String displayName;
  String accessToken;
  String refreshToken;
  String id;

  SignupResponseModel({
    required this.firstName,
    required this.lastName,
    required this.displayName,
    required this.accessToken,
    required this.refreshToken,
    required this.id,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) => SignupResponseModel(
    firstName: json["firstName"],
    lastName: json["lastName"],
    displayName: json["displayName"],
    accessToken: json["access_token"],
    refreshToken: json["refresh_token"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "displayName": displayName,
    "access_token": accessToken,
    "refresh_token": refreshToken,
    "id": id,
  };
}
