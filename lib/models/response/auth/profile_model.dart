// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
    String accessToken;
    User user;

    SignupModel({
        required this.accessToken,
        required this.user,
    });

    factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        accessToken: json["accessToken"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "user": user.toJson(),
    };
}

class User {
    String accountStatus;
    dynamic avatarId;
    DateTime createdAt;
    String displayName;
    String email;
    String firstName;
    String id;
    dynamic image;
    String lastName;
    String provider;
    dynamic providerId;
    String role;
    DateTime updatedAt;

    User({
        required this.accountStatus,
        this.avatarId,
        required this.createdAt,
        required this.displayName,
        required this.email,
        required this.firstName,
        required this.id,
        this.image,
        required this.lastName,
        required this.provider,
        this.providerId,
        required this.role,
        required this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        accountStatus: json["accountStatus"],
        avatarId: json["avatarId"],
        createdAt: DateTime.parse(json["createdAt"]),
        displayName: json["displayName"],
        email: json["email"],
        firstName: json["firstName"],
        id: json["id"],
        image: json["image"],
        lastName: json["lastName"],
        provider: json["provider"],
        providerId: json["providerId"],
        role: json["role"],
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "accountStatus": accountStatus,
        "avatarId": avatarId,
        "createdAt": createdAt.toIso8601String(),
        "displayName": displayName,
        "email": email,
        "firstName": firstName,
        "id": id,
        "image": image,
        "lastName": lastName,
        "provider": provider,
        "providerId": providerId,
        "role": role,
        "updatedAt": updatedAt.toIso8601String(),
    };
}

