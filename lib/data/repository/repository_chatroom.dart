import 'package:mini_project/data/data_source/data_chatroom.dart';
import 'dart:convert';

// import 'package:mini_project/domain/entities/user_data.dart';

class ChatroomRepository {
  var chatroomDatasource = ChatroomDataSource();

  Future<List<String>> getUserData(String username) async {
    var jsonArray = jsonDecode(await chatroomDatasource.getUserData(username))['data']['rooms'];
    List<String> listUserData = List<String>.from(jsonArray);
    return listUserData;
  }
}
