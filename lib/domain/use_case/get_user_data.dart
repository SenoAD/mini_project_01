import 'package:mini_project/domain/entities/user_data.dart';
import 'package:mini_project/data/repository/repository_chatroom.dart';


class GetUserData{
  var repository = ChatroomRepository();
  Future<List> execute(String username){
    return repository.getUserData(username);

  }
}