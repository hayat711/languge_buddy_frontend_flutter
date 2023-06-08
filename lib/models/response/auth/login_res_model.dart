// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    User user;
    String accessToken;

    LoginResponseModel({
        required this.user,
        required this.accessToken,
    });

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        user: User.fromJson(json["user"]),
        accessToken: json["accessToken"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "accessToken": accessToken,
    };
}

class User {
    String id;
    DateTime createdAt;
    DateTime updatedAt;
    String provider;
    dynamic providerId;
    String email;
    String firstName;
    String lastName;
    String displayName;
    dynamic image;
    dynamic age;
    dynamic birthdate;
    dynamic nationality;
    dynamic location;
    dynamic interests;
    String role;
    String accountStatus;
    List<dynamic> languages;

    User({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.provider,
        this.providerId,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.displayName,
        this.image,
        this.age,
        this.birthdate,
        this.nationality,
        this.location,
        this.interests,
        required this.role,
        required this.accountStatus,
        required this.languages,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        provider: json["provider"],
        providerId: json["providerId"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        displayName: json["displayName"],
        image: json["image"],
        age: json["age"],
        birthdate: json["birthdate"],
        nationality: json["nationality"],
        location: json["location"],
        interests: json["interests"],
        role: json["role"],
        accountStatus: json["accountStatus"],
        languages: List<dynamic>.from(json["languages"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "provider": provider,
        "providerId": providerId,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "displayName": displayName,
        "image": image,
        "age": age,
        "birthdate": birthdate,
        "nationality": nationality,
        "location": location,
        "interests": interests,
        "role": role,
        "accountStatus": accountStatus,
        "languages": List<dynamic>.from(languages.map((x) => x)),
    };
}
