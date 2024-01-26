import 'package:flutter/material.dart';
import 'package:mini_project/domain/use_case/get_chat_data.dart';
import 'package:mini_project/domain/use_case/post_chat.dart';
import 'package:mini_project/domain/entities/chat_data.dart';

class ChatroomPage extends StatefulWidget{
  List chat;
  String room;
  String username;
  ChatroomPage({super.key, required this.chat, required this.username, required this.room});
  @override
  State<ChatroomPage> createState() => ChatroomPageState(this.chat, this.username, this.room);
  
}

class ChatroomPageState extends State<ChatroomPage>{
  TextEditingController _chatroomcontroller = TextEditingController();
  List chat;
  String username;
  String room;
  ChatroomPageState(this.chat, this.username, this.room);

  @override
  void initState() {

    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${chat[0]['users'][1]}'),
        centerTitle: true,
      ),
      body: Container(
        child:
        Column( children : [ Expanded(child:
          FutureBuilder<List>(
            future: GetChatData().execute(room),
            builder: (context, snapshot){
              if(snapshot.hasData){
                var listChatdata = snapshot.data!;
                return ListView(
                  children: List.generate(listChatdata.length, (index) {
                    return Card(
                      child: Column(
                        children: [
                          Text('${listChatdata[index]['username']}'),
                          Text('${listChatdata[index]['text']}'),
                        ],
                      ),
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
          // TextField(
          //   controller: _chatroomcontroller,
          // )
        ),
        Expanded(child: TextFormField(
          controller: _chatroomcontroller,
        )),
        ElevatedButton(onPressed: (){
          setState(() {
            PostChat().execute(ChatData(username: username, text: _chatroomcontroller.text, id: room));
          });
        }, child: Text('Send'))
        ]),

    ));

  }

}