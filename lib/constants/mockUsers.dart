import 'dart:convert';

import 'package:language_buddy/models/response/auth/signup_res_model.dart';

List<dynamic> parseMockUsers(String jsonString) {
  final List<dynamic> jsonList = json.decode(jsonString);
  return jsonList
      .map((json) => json['user'])
      .where((user) => user != null)
      .toList();
}


List<Map<String, Object>> mockUsersJson = [
  {
    "user": {
      "provider": "email",
      "email": "john@example.com",
      "firstName": "John",
      "lastName": "Doe",
      "displayName": "JohnDoe",
      "providerId": null,
      "image": "avatar0.jpg",
      "language": "French",
      "age": 25,
      "birthdate": "1998-05-15",
      "nationality": "United States",
      "location": "New York",
      "interests": ["Languages", "Travel", "Culture"],
      "id": "U1",
      "createdAt": "2023-06-08T12:00:00Z",
      "updatedAt": "2023-06-08T12:00:00Z",
      "role": "user",
      "accountStatus": "active"
    },
    "accessToken": "accessToken1",
    "refreshToken": "refreshToken1"
  },
  {
    "user": {
      "provider": "email",
      "email": "emma@example.com",
      "firstName": "Emma",
      "lastName": "Johnson",
      "displayName": "EmmaJ",
      "providerId": null,
      "image": "avatar2.jpg",
      "language" : "Spanish",
      "age": 30,
      "birthdate": "1993-10-22",
      "nationality": "United Kingdom",
      "location": "London",
      "interests": ["Languages", "Art", "Music"],
      "id": "U2",
      "createdAt": "2023-06-08T12:00:00Z",
      "updatedAt": "2023-06-08T12:00:00Z",
      "role": "user",
      "accountStatus": "active"
    },
    "accessToken": "accessToken2",
    "refreshToken": "refreshToken2"
  },
  {
    "user": {
      "provider": "email",
      "email": "alex@example.com",
      "firstName": "Alex",
      "lastName": "Smith",
      "displayName": "Alex Yu",
      "providerId": null,
      "image": "avatar3.jpg",
      "language" : "German",
      "age": 28,
      "birthdate": "1995-08-10",
      "nationality": "Canada",
      "location": "Toronto",
      "interests": ["Languages", "Sports", "Cooking"],
      "id": "U3",
      "createdAt": "2023-06-08T12:00:00Z",
      "updatedAt": "2023-06-08T12:00:00Z",
      "role": "user",
      "accountStatus": "active"
    },
    "accessToken": "accessToken3",
    "refreshToken": "refreshToken3"
  },
  {
    "user": {
      "provider": "email",
      "email": "laura@example.com",
      "firstName": "Laura",
      "lastName": "Wilson",
      "displayName": "LauraW",
      "providerId": null,
      "image": "avatar4.jpg",
      "language" : "English",
      "age": 27,
      "birthdate": "1996-03-18",
      "nationality": "Australia",
      "location": "Sydney",
      "interests": ["Languages", "Photography", "Nature"],
      "id": "U4",
      "createdAt": "2023-06-08T12:00:00Z",
      "updatedAt": "2023-06-08T12:00:00Z",
      "role": "user",
      "accountStatus": "active"
    },
    "accessToken": "accessToken4",
    "refreshToken": "refreshToken4"
  },
  {
    "user": {
      "provider": "email",
      "email": "michael@example.com",
      "firstName": "Michael",
      "lastName": "Brown",
      "displayName": "MichaelB",
      "providerId": null,
      "image": "avatar5.jpg",
      "age": 32,
      "language" : "Korean",
      "birthdate": "1989-12-07",
      "nationality": "Germany",
      "location": "Berlin",
      "interests": ["Languages", "Technology", "Gaming"],
      "id": "U5",
      "createdAt": "2023-06-08T12:00:00Z",
      "updatedAt": "2023-06-08T12:00:00Z",
      "role": "user",
      "accountStatus": "active"
    },
    "accessToken": "accessToken5",
    "refreshToken": "refreshToken5"
  }
];

String mockUsersJsonString = jsonEncode(mockUsersJson);

List<dynamic> mockUsers = parseMockUsers(mockUsersJsonString);
