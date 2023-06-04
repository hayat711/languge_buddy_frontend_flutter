// To parse this JSON data, do
//
//     final conversationModel = conversationModelFromJson(jsonString);

import 'dart:convert';

ConversationModel conversationModelFromJson(String str) => ConversationModel.fromJson(json.decode(str));

String conversationModelToJson(ConversationModel data) => json.encode(data.toJson());

class ConversationModel {
    DateTime createdAt;
    Creator creator;
    String id;
    Creator recipient;
    DateTime updatedAt;

    ConversationModel({
        required this.createdAt,
        required this.creator,
        required this.id,
        required this.recipient,
        required this.updatedAt,
    });

    factory ConversationModel.fromJson(Map<String, dynamic> json) => ConversationModel(
        createdAt: DateTime.parse(json["createdAt"]),
        creator: Creator.fromJson(json["creator"]),
        id: json["id"],
        recipient: Creator.fromJson(json["recipient"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "creator": creator.toJson(),
        "id": id,
        "recipient": recipient.toJson(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class Creator {
    String id;
    String displayName;
    dynamic image;

    Creator({
        required this.id,
        required this.displayName,
        this.image,
    });

    factory Creator.fromJson(Map<String, dynamic> json) => Creator(
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

