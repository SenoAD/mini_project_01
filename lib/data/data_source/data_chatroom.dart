import 'package:http/http.dart' as http;
import 'dart:convert';


class ChatroomDataSource {
  static const URL = 'http://127.0.0.1:8080';

  Future<String> getUserData(String username) async{
    var response = await http.get(Uri.parse('${URL}/api/user/${username}'));
    return response.body;
  }

}