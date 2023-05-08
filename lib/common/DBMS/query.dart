// 此程式暫時廢置，只有要連接一次gdb之後都是透過firebase所以不用寫query
import 'package:neo4driver/neo4driver.dart';

class gdbQuery {
  static void createRelationship() async {
    NeoClient().createRelationship(
      startNodeId: 1,
      endNodeId: 2,
      relationshipLabel: "rel_label",
      properties: {
        "Property1": "value1",
        "Property2": 2,
      },
    );
  }
}
