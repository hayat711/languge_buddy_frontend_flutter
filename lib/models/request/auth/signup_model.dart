// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
    String firstName;
    String lastName;
    String displayName;
    String email;
    String password;

    SignupModel({
        required this.firstName,
        required this.lastName,
        required this.displayName,
        required this.email,
        required this.password,
    });

    factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        displayName: json["displayName"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "displayName": displayName,
        "email": email,
        "password": password,
    };
}
