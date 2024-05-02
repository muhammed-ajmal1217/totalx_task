import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:totalx_machine_task/model/user_data_model.dart';

class DataService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
Stream<List<UserDataModel>> getUsers() {
  return firestore.collection('users_collection').snapshots().map((querySnapshot) {
    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return UserDataModel.fromJson(data);
    }).toList();
  });
}
Future<void> addUserCollection(UserDataModel users) async {
  await firestore.collection('users_collection').doc().set(
    users.toJson(),
  );
}
}