import 'dart:convert';

AddLanguageModel addLanguageModelFromJson(String str) => AddLanguageModel.fromJson(json.decode(str));

String addLanguageModelToJson(AddLanguageModel data) => json.encode(data.toJson());

class AddLanguageModel {
  String name;
  String level;
  bool isNative;
  String location;

    AddLanguageModel({
        required this.name,
        required this.level,
        required this.isNative,
        required this.location,
    });



    factory AddLanguageModel.fromJson(Map<String, dynamic> json) => AddLanguageModel(
        name: json["name"],
        level: json["level"],
        isNative: json["isNative"],
        location: json["location"],

    );

    Map<String, dynamic> toJson() => {
        "name": name,
         "level": level,
        "isNative": isNative,
        "location": location,
    };
}