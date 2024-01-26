import 'package:flutter/material.dart';
import 'package:mini_project/domain/entities/room_data.dart';
import 'package:mini_project/domain/use_case/get_room_data.dart';
import 'package:mini_project/domain/use_case/get_user_data.dart';
import 'package:mini_project/domain/use_case/post_chat.dart';
import 'package:mini_project/domain/use_case/post_roomchat.dart';
import 'package:mini_project/presentation/widgets/chatroom_page.dart';


class HomePage extends StatefulWidget{
  final String username;
  const HomePage({super.key, required this.username});
  @override

  State<HomePage> createState() => HomePageState(username);

}

class HomePageState extends State<HomePage>{
  TextEditingController _searchcontroller = TextEditingController();
  late String username;
  HomePageState(this.username);

  Future<void> _alertDialog() async {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Peringatan'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                TextField(
                  controller: _searchcontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username'
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Chat'),
              onPressed: () {
                setState(() {
                  PostRoomChat().execute(RoomId(username: username, username2: _searchcontroller.text));
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  List<String> roomList = [];
  void initState() {
    // super.initState();
    GetUserData().execute(username).then((result) {
      setState(() {
        roomList = result.cast<String>();
      });
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Column (
          children :[
                      Container(
          height: 300,
          child: FutureBuilder(
              future: GetRoomData().execute(username),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  var listRoomdata = snapshot.data!;
                  return ListView(
                    children: List.generate(listRoomdata.length, (index) {
                      return InkWell(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ChatroomPage(chat: [listRoomdata[index]], username : username , room: roomList[index],)));
                      },
                        child: Text('${listRoomdata[index]['users'][1]}'),
                      );
                    })

                    ,
                  );
                }else if (snapshot.hasError){
                  return Text('${snapshot.error}');
                }else{
                  return const Text('belum ada data');
                }
              }),
        ),
                      Container(child: ElevatedButton(onPressed: (){_alertDialog();}, child: Text('Tambah Kontak')),)
    ]))
    ;

  }

}