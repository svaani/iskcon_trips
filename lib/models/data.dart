import 'package:cloud_firestore/cloud_firestore.dart';

class Data {
  String _collectionRef;
  Firestore _db = Firestore.instance;

  Data(collectionRef) {
    _collectionRef = collectionRef;
    
    // db.collection("Participant").add({"name":"GeethaGamya"});
  }

  Future<bool> add(content){
    var val = _db.collection(_collectionRef).add(content);
    print(val);
  }
  Future<dynamic> get() async {
    QuerySnapshot xyz = await _db.collection(_collectionRef).getDocuments();
    List allData = [];
    xyz.documents.forEach((entry) {
      allData.add(entry.data);
    });
    return allData;
  }
  
  Future<dynamic> getBy(key,val) async {
    QuerySnapshot xyz = await _db.collection(_collectionRef).getDocuments();
    List allData = [];
    xyz.documents.forEach((entry) {
      if(entry.data[key] == val)
      allData.add(entry.data);
    });
    return allData;
  }

  Future<bool> doesExist(String key, String val) async {
    QuerySnapshot xyz = await _db.collection(_collectionRef).getDocuments();
    return -1 !=
        xyz.documents.indexWhere((entry) {
          return val == entry.data[key];
        });
  }
}
