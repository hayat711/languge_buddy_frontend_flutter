import 'dart:convert';

AddLanguageModel addLanguageModelFromJson(String str) => AddLanguageModel.fromJson(json.decode(str));

String addLanguageModelToJson(AddLanguageModel data) => json.encode(data.toJson());

class AddLanguageModel {
  String name;
  String level;
  bool isNative;

    AddLanguageModel({
        required this.name,
        required this.level,
        required this.isNative,
    });



    factory AddLanguageModel.fromJson(Map<String, dynamic> json) => AddLanguageModel(
        name: json["name"],
        level: json["level"],
        isNative: json["isNative"],

    );

    Map<String, dynamic> toJson() => {
        "name": name,
         "level": level,
        "isNative": isNative,
    };
}