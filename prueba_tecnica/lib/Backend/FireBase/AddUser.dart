import 'FirebaseConection.dart';

class FirebaseConection {
  static Future<bool> addUser(
      String nombreCompleto,
      String email,
      String direccion,
      int telefono,
      int identificacion,
      String departamento,
      String ciudad) async {
    try {
      await userRegisterCollection.add({
        'name': nombreCompleto,
        'email': email,
        'direccion': direccion,
        'telefono': telefono,
        'identificacion': identificacion,
        'departamento': departamento,
        'ciudad': ciudad,
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
