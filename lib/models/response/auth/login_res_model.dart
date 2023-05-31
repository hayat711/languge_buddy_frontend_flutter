// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    String id;
    String accessToken;
    String refreshToken;

    LoginResponseModel({
        required this.id,
        required this.accessToken,
        required this.refreshToken,
    });

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        id: json["id"],
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
    };
}
