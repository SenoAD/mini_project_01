import 'package:flutter/material.dart';
import 'package:mini_project/presentation/widgets/home_page.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();

}

class LoginPageState extends State<LoginPage> {
  TextEditingController _usernamecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _usernamecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username'
              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(username: _usernamecontroller.text)));
            }, child: const Text('Login'))
          ],
        ),
      ),
    );

  }

}