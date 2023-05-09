import 'dart:async';
import 'dart:convert';

// import 'package:neo4driver/neo4driver.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';

Future<void> addNewUsr(String nickName, String whisper) async {
  final response = await http.post(
    Uri.parse('neo4j+s://73b8649a.databases.neo4j.io'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'X-Stream': 'true',
      'Authorization':
          'Basic bmVvNGo6RUFOU3BOaUxHZ25YVFBqOE9UUUU5SFNYSjBiNGEyc0lWVTJiNkQ0NEtKcw=='
    },
    body: jsonEncode(<String, List<Map<String, Object>>>{
      "statements": [
        {
          "statement": "CREATE (User:person \$props) ",
          "parameters": {
            "props": {
              "名": nickName,
            }
          }
        },
        {
          "statement": "CREATE (whisper:Preference \$props)",
          "parameters": {
            "props": {"敘述": whisper}
          }
        },
        {
          "statement": "CREATE (User)-[:喜好\$props]->(whisper) ",
          "parameters": {
            "props": {"面向": "聊天主題"}
          }
        }
      ]
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    // return person.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to add new node');
  }
}

class person {
  final String usrName;
  final String whisper;

  const person({required this.usrName, required this.whisper});
  factory person.fromJson(Map<String, dynamic> json) {
    return person(usrName: json['名'], whisper: json['perfer']);
  }
}
