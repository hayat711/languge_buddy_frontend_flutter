import 'package:language_buddy/models/response/chat/ConversationModel.dart';

List<ConversationModel> loadConversations() {
  List<Map<String, dynamic>> jsonList = [
  {
    "createdAt": "2022-01-01T10:00:00Z",
    "creator": {
      "id": "1",
      "displayName": "Ahmed",
      "image": null
    },
    "id": "1",
    "recipient": {
      "id": "2",
      "displayName": "Doe",
      "image": null
    },
    "updatedAt": "2022-01-01T10:00:00Z"
  },
  {
    "createdAt": "2022-02-02T10:00:00Z",
    "creator": {
      "id": "3",
      "displayName": "Emma",
      "image": null
    },
    "id": "2",
    "recipient": {
      "id": "4",
      "displayName": "Johnson",
      "image": null
    },
    "updatedAt": "2022-02-02T10:00:00Z"
  },
  {
    "createdAt": "2022-03-03T10:00:00Z",
    "creator": {
      "id": "5",
      "displayName": "Alex Yu",
      "image": null
    },
    "id": "3",
    "recipient": {
      "id": "6",
      "displayName": "Smith",
      "image": null
    },
    "updatedAt": "2022-03-03T10:00:00Z"
  },
  {
    "createdAt": "2022-04-04T10:00:00Z",
    "creator": {
      "id": "7",
      "displayName": "Laura",
      "image": null
    },
    "id": "4",
    "recipient": {
      "id": "8",
      "displayName": "MichaelB",
      "image": null
    },
    "updatedAt": "2022-04-04T10:00:00Z"
  },
  {
    "createdAt": "2022-05-05T10:00:00Z",
    "creator": {
      "id": "9",
      "displayName": "Wilson",
      "image": null
    },
    "id": "5",
    "recipient": {
      "id": "10",
      "displayName": "Brown",
      "image": null
    },
    "updatedAt": "2022-05-05T10:00:00Z"
  }
];

  return jsonList.map((json) => ConversationModel.fromJson(json)).toList();
}
