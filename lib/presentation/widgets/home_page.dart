import 'package:flutter/material.dart';
import 'package:mini_project/domain/use_case/get_room_data.dart';
import 'package:mini_project/domain/use_case/get_user_data.dart';
import 'package:mini_project/presentation/widgets/chatroom_page.dart';


class HomePage extends StatefulWidget{
  final String username;
  const HomePage({super.key, required this.username});
  @override

  State<HomePage> createState() => HomePageState(username);

}

class HomePageState extends State<HomePage>{
  late String username;
  HomePageState(this.username);
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
      body: Container(
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
      )
    ;

  }

}