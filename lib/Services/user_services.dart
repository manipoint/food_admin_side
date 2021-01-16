import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_admin_side/Helper/constent.dart';
import 'package:food_admin_side/Model/user.dart';

class UserServices {
  String adminCollection = "admins";
  String userCollection = "users";

  void createAdmin({String id, String name, String email}) {
    firebaseFirestore
        .collection(adminCollection)
        .doc(id)
        .set({"name": name, "id": id, "email": email});
  }

  void updateUser(Map<String, dynamic> values) {
    firebaseFirestore
        .collection(adminCollection)
        .doc(values['id'])
        .update(values);
  }

  Future<UserModel> getAdminById(String id) =>
      firebaseFirestore.collection(adminCollection).doc(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });
  Future<List<UserModel>> getAllUsers() async =>
      firebaseFirestore.collection(userCollection).get().then((value) {
        List<UserModel> users = [];
        for (DocumentSnapshot user in value.docs) {
          users.add(UserModel.fromSnapshot(user));
        }
        return users;
      });
}
