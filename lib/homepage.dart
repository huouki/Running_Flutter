import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
void dispose() {

}
final userController = TextEditingController();
final passController = TextEditingController();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: 
      Scaffold( backgroundColor: Colors.purple[40],
        appBar: 
        AppBar(title: Text('Demo App'),
        backgroundColor: Colors.purple[100],
        ),
        body: 
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login to see the full Page'),
              Padding(padding: EdgeInsets.all(50)),
               SizedBox(
            width: 180,

            child: TextField(
              controller: userController,
              decoration: InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(),
            )
            ),
          ),

          Padding(padding: EdgeInsets.all(10)), // eto para may space kayo

          SizedBox(
            width: 180,
            child: TextField(
              controller: passController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
            )
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          FloatingActionButton(onPressed: (){
            if(userController.text == 'joshua' && passController.text == 'josh'){
              print('tamaaaaaa');
            }
            else{
              print('malliii');
            }
          }),
            ],
          ),
          ),
      ),
    );
  }
}
