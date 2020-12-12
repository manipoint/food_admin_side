import 'package:food_admin_side/Helper/constent.dart';
import 'package:food_admin_side/Model/user.dart';

class UserServices {
  String collection = "admins";

  void createUser({String id, String name, String email}) {
    firebaseFirestore
        .collection(collection)
        .doc(id)
        .set({"name": name, "id": id, "email": email});
  }

  void updateUser(Map<String, dynamic> values) {
    firebaseFirestore.collection(collection).doc(values['id']).update(values);
  }

  Future<UserModel> getUserById(String id) =>
      firebaseFirestore.collection(collection).doc(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });
}
