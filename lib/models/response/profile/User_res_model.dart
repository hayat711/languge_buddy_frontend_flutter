// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String id;
    DateTime createdAt;
    DateTime updatedAt;
    String provider;
    dynamic providerId;
    String accountStatus;
    dynamic avatarId;
    String displayName;
    String email;
    String firstName;
    dynamic image;
    String lastName;
    String role;

    UserModel({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.provider,
        this.providerId,
        required this.accountStatus,
        this.avatarId,
        required this.displayName,
        required this.email,
        required this.firstName,
        this.image,
        required this.lastName,
        required this.role,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        provider: json["provider"],
        providerId: json["providerId"],
        accountStatus: json["accountStatus"],
        avatarId: json["avatarId"],
        displayName: json["displayName"],
        email: json["email"],
        firstName: json["firstName"],
        image: json["image"],
        lastName: json["lastName"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "provider": provider,
        "providerId": providerId,
        "accountStatus": accountStatus,
        "avatarId": avatarId,
        "displayName": displayName,
        "email": email,
        "firstName": firstName,
        "image": image,
        "lastName": lastName,
        "role": role,
    };
}

