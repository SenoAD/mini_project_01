import 'package:http/http.dart' as http;
import 'dart:convert';


class ChatroomDataSource {
  static const URL = 'http://127.0.0.1:8080';

  Future<String> getUserData(String username) async{
    var response = await http.get(Uri.parse('${URL}/api/user/${username}'));
    return response.body;
  }

  Future<String> getChatData(String id) async{
    var response = await http.get(Uri.parse('${URL}/api/chat/${id}'));
    var tes = jsonDecode(response.body);
    print('${tes['data']}');
    return response.body;
  }

  Future<String> getRoomData(String username) async{
    var response = await http.get(Uri.parse('${URL}/api/room/${username}'));
    // var tes = jsonDecode(response.body)['data'];
    // print('${tes}');
    return response.body;
  }

  Future postChat(Map<String,dynamic> chat) async{
    var response = await http.post(
      Uri.parse('${URL}/api/chat'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id' : chat['id'],
        'from': chat['username'],
        'text': chat['text'],
      }),
    );
    return response.body;
  }

  Future createRoomChat(Map<String,dynamic> roomId) async{
    var response = await http.post(
      Uri.parse('${URL}/api/room'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'from' : roomId['username'],
        'to': roomId['username1'],
      }),
    );
    return response.body;
  }
}