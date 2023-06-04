// To parse this JSON data, do
//
//     final roomModel = roomModelFromJson(jsonString);

import 'dart:convert';

RoomModel roomModelFromJson(String str) => RoomModel.fromJson(json.decode(str));

String roomModelToJson(RoomModel data) => json.encode(data.toJson());

class RoomModel {
    DateTime createdAt;
    String description;
    String id;
    bool isPublic;
    List<Owner> mods;
    String name;
    Owner owner;
    DateTime updatedAt;
    List<Owner> users;

    RoomModel({
        required this.createdAt,
        required this.description,
        required this.id,
        required this.isPublic,
        required this.mods,
        required this.name,
        required this.owner,
        required this.updatedAt,
        required this.users,
    });

    factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
        createdAt: DateTime.parse(json["createdAt"]),
        description: json["description"],
        id: json["id"],
        isPublic: json["isPublic"],
        mods: List<Owner>.from(json["mods"].map((x) => Owner.fromJson(x))),
        name: json["name"],
        owner: Owner.fromJson(json["owner"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        users: List<Owner>.from(json["users"].map((x) => Owner.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "description": description,
        "id": id,
        "isPublic": isPublic,
        "mods": List<dynamic>.from(mods.map((x) => x.toJson())),
        "name": name,
        "owner": owner.toJson(),
        "updatedAt": updatedAt.toIso8601String(),
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
    };
}

class Owner {
    String id;
    String displayName;
    dynamic image;

    Owner({
        required this.id,
        required this.displayName,
        this.image,
    });

    factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"],
        displayName: json["displayName"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "displayName": displayName,
        "image": image,
    };
}

