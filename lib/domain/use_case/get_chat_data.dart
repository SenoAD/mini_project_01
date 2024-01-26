// import 'package:mini_project/domain/entities/chat_data.dart';
import 'package:mini_project/data/repository/repository_chatroom.dart';


class GetChatData{
  var repository = ChatroomRepository();
  Future<List> execute(String id){
    return repository.getChatData(id);

  }
}