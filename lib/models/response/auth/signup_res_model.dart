// To parse this JSON data, do
//
//     final signupResponseModel = signupResponseModelFromJson(jsonString);

import 'dart:convert';

SignupResponseModel signupResponseModelFromJson(String str) => SignupResponseModel.fromJson(json.decode(str));

String signupResponseModelToJson(SignupResponseModel data) => json.encode(data.toJson());

class SignupResponseModel {
  User user;
  String accessToken;
  String refreshToken;

  SignupResponseModel({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) => SignupResponseModel(
    user: User.fromJson(json["user"]),
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };
}

class User {
  String provider;
  String email;
  String firstName;
  String lastName;
  String displayName;
  dynamic providerId;
  dynamic image;
  dynamic age;
  dynamic birthdate;
  dynamic nationality;
  dynamic location;
  dynamic interests;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String role;
  String accountStatus;

  User({
    required this.provider,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.displayName,
    this.providerId,
    this.image,
    this.age,
    this.birthdate,
    this.nationality,
    this.location,
    this.interests,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
    required this.accountStatus,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    provider: json["provider"],
    email: json["email"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    displayName: json["displayName"],
    providerId: json["providerId"],
    image: json["image"],
    age: json["age"],
    birthdate: json["birthdate"],
    nationality: json["nationality"],
    location: json["location"],
    interests: json["interests"],
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    role: json["role"],
    accountStatus: json["accountStatus"],
  );

  Map<String, dynamic> toJson() => {
    "provider": provider,
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "displayName": displayName,
    "providerId": providerId,
    "image": image,
    "age": age,
    "birthdate": birthdate,
    "nationality": nationality,
    "location": location,
    "interests": interests,
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "role": role,
    "accountStatus": accountStatus,
  };
}
