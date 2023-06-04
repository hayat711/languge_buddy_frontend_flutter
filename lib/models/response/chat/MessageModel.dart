// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'dart:convert';

MessageModel messageModelFromJson(String str) => MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
    Author author;
    Conversation conversation;
    DateTime createdAt;
    bool edited;
    bool haveSeen;
    String id;
    String text;
    DateTime updatedAt;

    MessageModel({
        required this.author,
        required this.conversation,
        required this.createdAt,
        required this.edited,
        required this.haveSeen,
        required this.id,
        required this.text,
        required this.updatedAt,
    });

    factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        author: Author.fromJson(json["author"]),
        conversation: Conversation.fromJson(json["conversation"]),
        createdAt: DateTime.parse(json["createdAt"]),
        edited: json["edited"],
        haveSeen: json["haveSeen"],
        id: json["id"],
        text: json["text"],
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "author": author.toJson(),
        "conversation": conversation.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "edited": edited,
        "haveSeen": haveSeen,
        "id": id,
        "text": text,
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class Author {
    String id;
    String displayName;

    Author({
        required this.id,
        required this.displayName,
    });

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        displayName: json["displayName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "displayName": displayName,
    };
}

class Conversation {
    String id;

    Conversation({
        required this.id,
    });

    factory Conversation.fromJson(Map<String, dynamic> json) => Conversation(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}

