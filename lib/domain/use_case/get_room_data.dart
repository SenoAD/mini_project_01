// import 'package:mini_project/domain/entities/user_data.dart';
import 'package:mini_project/data/repository/repository_chatroom.dart';


class GetRoomData{
  var repository = ChatroomRepository();
  Future<List> execute(String username){
    return repository.getRoomData(username);

  }
}