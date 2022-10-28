import 'package:cloud_firestore/cloud_firestore.dart';

import 'FirebaseConection.dart';

class MaquinaDatos {
  static Future<List> getMaquinas() async {
    List maquinas = [];
    try {
      await maquinaCollection.get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          maquinas.add(doc.data());
        });
      });
      return maquinas;
    } catch (e) {
      return maquinas;
    }
  }
}
