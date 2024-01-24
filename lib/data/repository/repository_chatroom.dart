import 'package:mini_project/data/data_source/data_chatroom.dart';
import 'dart:convert';

// import 'package:mini_project/domain/entities/user_data.dart';

class ChatroomRepository {
  var chatroomDatasource = ChatroomDataSource();

  Future<List> getUserData(String username) async {
    var jsonArray = jsonDecode(await chatroomDatasource.getUserData(username))['data'];
    // var listUserData = <UserData>[];
    //     listUserData.add(UserData.fromJson(jsonArray['username']));
    return jsonArray;
}
}