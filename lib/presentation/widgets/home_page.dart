import 'package:flutter/material.dart';
import 'package:mini_project/domain/entities/user_data.dart';
import 'package:mini_project/domain/use_case/get_user_data.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget{
  final String username;
  const HomePage({super.key, required this.username});
  @override

  State<HomePage> createState() => HomePageState(this.username);

}

class HomePageState extends State<HomePage>{
  late String username;
  HomePageState(this.username);
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
      ),
      body: Container(
          height: 300,
          child: FutureBuilder<List<String>>(
            future: GetUserData().execute(username),
            builder: (context,snapshot){
              var listUserData = snapshot.data;
              return
                ListView(
                children:
                  List.generate(listUserData!.length, (index) {
                    return GestureDetector(
                      onTap: (){},
                      child: Card(
                        child: Column(
                          children: [
                            Text('${listUserData[index]}')
                          ],
                        ),
                      ) ,
                    )
                    ;
                  })
                ,
              );
            } ,
      )
        ),
      )
    ;
    throw UnimplementedError();
  }

}