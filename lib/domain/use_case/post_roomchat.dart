import 'package:mini_project/data/repository/repository_chatroom.dart';
import 'package:mini_project/domain/entities/room_data.dart';

class PostRoomChat{
  var repository = ChatroomRepository();

  Future<List> execute(RoomId roomId){
    return repository.createRoomChat(roomId);
  }
}