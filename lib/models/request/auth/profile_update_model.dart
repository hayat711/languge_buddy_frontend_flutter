import 'dart:convert';

ProfileUpdateReq profileUpdateReqFromJson(String str) => ProfileUpdateReq.fromJson(json.decode(str));

String profileUpdateReqToJson(ProfileUpdateReq data) => json.encode(data.toJson());

class ProfileUpdateReq {
    ProfileUpdateReq({
        required this.location,
        required this.birthdate,
        required this.profile,
        required this.interests,
    });

    final String location;
    final DateTime birthdate;
    final String profile;
    final List<String> interests;

    factory ProfileUpdateReq.fromJson(Map<String, dynamic> json) => ProfileUpdateReq(
        location: json["location"],
        birthdate: json["birthdate"],
        profile: json["profile"],
        interests: List<String>.from(json["interests"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "location": location,
        "birthdate": birthdate.toIso8601String(),
        "profile": profile,
        "interests": List<dynamic>.from(interests.map((x) => x)),
    };
}
