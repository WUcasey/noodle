import 'dart:async';
import 'dart:convert';

// import 'package:neo4driver/neo4driver.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<void> handSake() async {
  final response = await http.get(Uri.parse('http://localhost:7474'));
  if (response.statusCode == 200) {
    print("connect to graph database successfully.");
    print(jsonDecode(response.body));
  } else {
    throw Exception('fail to connect');
  }
}

Future<void> addNewUsr(String nickName, String whisper) async {
  final response = await http.post(
    Uri.parse('http://localhost/db/neo4j/tx'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'X-Stream': 'true',
      'Authorization': 'Basic bmVvNGo6MjAyM2NzaWVDR1U='
    },
    body: jsonEncode(<String, List<Map<String, Object>>>{
      "statements": [
        {
          "statement": "CREATE (User:Person {名: '黃'}) return User ",
          // "parameters": {
          //   "props": {
          //     "名": nickName,
          //   }
          // }
        },
        // {
        //   "statement": "CREATE (whisper:Preference \$props)",
        //   "parameters": {
        //     "props": {"敘述": whisper}
        //   }
        // },
        // {
        //   "statement": "CREATE (User)-[:喜好\$props]->(whisper) ",
        //   "parameters": {
        //     "props": {"面向": "聊天主題"}
        //   }
        // }
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
