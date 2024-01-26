import 'package:mini_project/data/data_source/data_chatroom.dart';
import 'dart:convert';

import 'package:mini_project/domain/entities/chat_data.dart';
import 'package:mini_project/domain/entities/room_data.dart';

class ChatroomRepository {
  var chatroomDatasource = ChatroomDataSource();

  Future<List> getUserData(String username) async {
    var jsonArray1 = jsonDecode(await chatroomDatasource.getUserData(username))['data']['rooms'];
    List<String> listUserData = List.from(jsonArray1);
    return listUserData;
  }

  Future<List> getChatData(String id) async {
    var jsonArray2 = jsonDecode(await chatroomDatasource.getChatData(id))['data']['messages'];
    List listChatData = List.from(jsonArray2);
    return listChatData;
  }

  Future<List> getRoomData(String username) async {
    var jsonArray3 = jsonDecode(await chatroomDatasource.getRoomData(username))['data'];
    List listRoomData = List.from(jsonArray3);
    return listRoomData;
  }

  Future<bool> postChat(ChatData chat) async{
    var response = await chatroomDatasource.postChat(chat.toJson());
    return jsonDecode(response)['data'];
  }

  Future<List> createRoomChat(RoomId roomId) async{
    var response = await chatroomDatasource.createRoomChat(roomId.toJson());
    return jsonDecode(response)['data'];
  }
}
