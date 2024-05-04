import 'package:flutter/material.dart';
import 'package:totalx_machine_task/model/user_data_model.dart';
import 'package:totalx_machine_task/service/data_service.dart';

class DataProvider extends ChangeNotifier{
  DataService data = DataService();
  Stream<List<UserDataModel>> getUsers() {
    return data.getUsers();
  }
  addUsersCollection(UserDataModel users)async{
    await data.addUserCollection(users);
    notifyListeners();
  }
}