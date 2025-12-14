import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
void main() {
  runApp(const MaterialApp(home: MyApp())); // needed to call another class\
}
void dispose() {
}



final userController = TextEditingController();
final passController = TextEditingController();
bool concealPass = true;

class MyApp extends StatefulWidget {  // 14-20 needs to be declare, so it can have setState in the onPress
 const MyApp ({super.key});
 @override
 State<MyApp> createState() => _MyApp();
}
showAlertDialog(BuildContext context){
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: (){
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text('Invalid Account', style: TextStyle(fontSize: 25)),
    backgroundColor: Colors.purple[50],
    content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 10)), //spacee between objectsss
              Text('Incorrect username or password.'),
            ],
          ),
        ),
        actions: [
          okButton,
        ],
        );
  showDialog(context: context, 
  builder: (BuildContext context){
    return alert;
  });
}
class _MyApp extends  State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: 
      Scaffold( backgroundColor: Colors.purple[40],
        appBar: 
        AppBar(title: Text('Cabuso Running Flutter'),
        backgroundColor: Colors.purple[200],
        ),
        body: 
        Center(
          child: Container(
            width: 400,
            height: 500,
            decoration: BoxDecoration(              
            gradient: LinearGradient(begin: 
            Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Color.fromRGBO(186, 146, 226, 1),
              Color.fromRGBO(211, 173, 235, 1),
              Color.fromRGBO(229, 216, 241, 1),
              Color.fromARGB(240,229, 216, 241),
              Color.fromRGBO(229, 216, 241, 1),
              Color.fromRGBO(211, 173, 235, 1),
              Color.fromRGBO(186, 146, 226, 1),
            ]
            ),
            borderRadius: BorderRadius.circular(20)
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                
              Image.asset('images/lavander(2).png',),

              Padding(padding: EdgeInsets.only(bottom: 30, top: 10)), //spacee between objectsss
              
              Text('Login to See Lavander', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 25, fontFamily: 'OpenSans'),),

              Padding(padding: EdgeInsets.all(25)), //spacee between objectsss

               SizedBox(
            width: 180,

            child: TextField(
              controller: userController,
              style: TextStyle(fontSize: 17, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: 'Username',
                hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
                labelText: 'Username',
                labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, fontFamily: 'OpenSans'),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
            )
            ),
          ),

          Padding(padding: EdgeInsets.all(10)), // eto para may space kayo

          SizedBox(
            width: 180,
            child: TextField(
              controller: passController,
              obscureText: concealPass,
              style: TextStyle(fontSize: 17, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
                labelText: 'Password',
                labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,fontFamily: 'OpenSans'),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
                suffixIcon: IconButton(
                  icon: Icon(concealPass ? Icons.visibility : Icons.visibility_off),
                  onPressed: (){ 
                    setState(() {
                      concealPass = !concealPass;
                    });
                  }, 
                  ),
            )
            ),
          ),

          Padding(padding: EdgeInsets.all(10)), //spacee between objectsss

         ElevatedButton(
          style: ButtonStyle(
            fixedSize: (WidgetStatePropertyAll(Size.fromHeight(40))),
            overlayColor: WidgetStatePropertyAll(Colors.purple[100], ),
            backgroundColor: 
              WidgetStatePropertyAll(
                Colors.purple[40]), 
            textStyle: 
            WidgetStatePropertyAll(
              TextStyle(
                
                color: Colors.black,
                fontSize: 20, 
                fontWeight: FontWeight.w600, 
                fontFamily: 'OpenSans',
                ),
                ),
                foregroundColor: WidgetStatePropertyAll(
                  Colors.black87,
                )
          ) ,
          child: const Text('Login'),
          onPressed: () {
            if(userController.text == 'joshua' && passController.text == 'josh'){
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => const Homepage(),
              ),
            );
            }
            else {
                  showAlertDialog(context);
            }
          },
        ),
            ],
          ),
          ),
          ),
      ),
    );
  }
}


class Homepage extends StatelessWidget {
  const Homepage({super.key});
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
              Text('Tamma Ba????'),
              Padding(padding: EdgeInsets.all(50)),//spacee between objectsss
              
            ],
          ),
          ),
      ),
    );
  }
}
