import 'package:mini_project/data/repository/repository_chatroom.dart';
import 'package:mini_project/domain/entities/chat_data.dart';

class PostChat{
  var repository = ChatroomRepository();

  Future<bool> execute(ChatData chat){
    return repository.postChat(chat);
  }
}