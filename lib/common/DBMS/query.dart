import 'dart:async';
import 'dart:convert';

import 'package:noodle/common/DBMS/names.dart';
import 'package:http/http.dart' as http;

Future<void> handSake() async {
  final response = await http
      .get(Uri.parse('http://localhost:7474'), headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'X-Stream': 'true',
    'Authorization': 'Basic bmVvNGo6MjAyM2NzaWVDR1U='
  });
  if (response.statusCode == 200) {
    print("can connect to graph database.");
    print(jsonDecode(response.body));
  } else {
    print('fail to connect');
    throw Exception();
  }
}

Future<void> addNewUsr(String nickName, var birth, String whisper) async {
  print('hello');
  final response = await http.post(
    Uri.parse('http://localhost/db/neo4j/tx/commit'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'X-Stream': 'true',
      'Authorization': 'Basic bmVvNGo6MjAyM2NzaWVDR1U=',
      'access-mode': 'WRITE'
    },
    body: jsonEncode(<String, List<Map<String, Object>>>{
      "statements": [
        {
          "statement": "CREATE (User:Person {名:'你好'}) return User ",
          // "parameters": {
          //   "props": {"名": nickName}
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
  print(response.body);
  if (response.statusCode == 200) {
    DBnames.UsrId = jsonDecode(response.body)['meta']['id'];
    print("Success to add new node");
    print(response.body);
  } else {
    throw Exception('Failed to add new node');
  }
}

// class person {
//   final String usrName;
//   final String whisper;

//   const person({required this.usrName, required this.whisper});
//   factory person.fromJson(Map<String, dynamic> json) {
//     return person(usrName: json['名'], whisper: json['perfer']);
//   }
// }
