import 'dart:io';
import 'dart:math';

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
        AppBar(
          title: Text('Lavander Login', style: TextStyle(fontFamily: 'OpenSans'),),

        backgroundColor: Colors.purple[200],
        ),
        body: 
        Center(
          child: Container(
            width: 400,
            height: 500,
            padding: EdgeInsets.all(0),
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
                
              Image.asset('images/lavander(2).png', alignment: AlignmentGeometry.topCenter,),

              Padding(padding: EdgeInsets.only(bottom: 30, top: 10)), //spacee between objectsss
              
              Text('Login to Know Lavander', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 25, fontFamily: 'OpenSans'),),

              Padding(padding: EdgeInsets.all(20)), //spacee between objectsss

               SizedBox(
            width: 230,

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
            width: 230,
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
        AppBar(title: Text('Lavander Home Page', style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
        backgroundColor: Colors.purple[100],
        ),
        body: 
        SingleChildScrollView(
          
            child:Center(
              
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(0)),
               Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                ),
                child:
              Image.asset('images/lavander_header.jpg', width: 800, opacity: const AlwaysStoppedAnimation(.7),),
               ),
              Padding(padding: EdgeInsets.all(5)),
              Padding(padding: EdgeInsets.only(left: 30, right: 30, ),
              child: SizedBox(
                width: 650,
                child: Column(
                  children: [
                 Text('Lavandula also known as Lavander is a genus of 47 known species of perennial flowering plants in the sage family, Lamiaceae.', textAlign:  TextAlign.justify, style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.normal, fontSize: 15),),
                 Padding(padding: EdgeInsetsGeometry.all(3)),
                 Text('Lavender, a type of herb, is famous for its lovely purple or bluish flowers that usually grow in fields. ', textAlign:  TextAlign.justify, style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.normal, fontSize: 15),),
                Padding(padding: EdgeInsetsGeometry.all(3)),
                 Text(' You can recognize these tiny flowers by their bright color, as well as by their tall stems and narrow, green leaves.', textAlign:  TextAlign.justify, style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.normal, fontSize: 15),),
                   ],
              ),
              ),
              ),

              Padding(padding: EdgeInsets.all(30)),
              Text('Benefits of Lavander', 
              style: TextStyle(fontSize: 30, fontFamily: 'OpenSans'),
              ),
              Padding(padding: EdgeInsets.all(10)),
              
              Padding(padding: EdgeInsets.only(left: 30, right: 30, ),
              child: Container(
                clipBehavior: Clip.hardEdge,
                width: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                child:
                 Image.asset('images/lavander_benifits.webp', width: 700,),
              ),
              ),
              
              Padding(padding: EdgeInsets.all(10)),
                    
              Padding(padding: EdgeInsets.only(left: 30, right: 30, ),
                 child:  SizedBox(
                  width: 650,
                child: Column(
                  children: [
                  Container(
                    
                    decoration: 
                    BoxDecoration(borderRadius: BorderRadius.circular(10),
                    color: Colors.deepPurple[100],
                    ),
                 child: Column(
                  children: [
                 Text('Supports Sleep', textAlign: TextAlign.start, style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold, fontSize: 20,),),
                 Padding(padding: EdgeInsetsGeometry.all(3)),
                 Text('Because of its calming scent, many people find benefits from using lavender-infused fragrances before bed as a form of aromatherapy.', textAlign:  TextAlign.justify, style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.normal, fontSize: 15),),
                 Padding(padding: EdgeInsetsGeometry.all(15)),
                  ]
                 )
                ),
                 Text('Reduces pain and inflammation', textAlign: TextAlign.start, style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold, fontSize: 20,),),
                 Padding(padding: EdgeInsetsGeometry.all(3)),
                 Text('“One of the chemical compounds in lavender include flavonoids, which are also found in vegetables and fruits, and coumarin. Both have anti-inflammatory and antioxidant actions,” explains Dr. Lin.', textAlign:  TextAlign.justify, style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.normal, fontSize: 15),),
                 Padding(padding: EdgeInsetsGeometry.all(15)),

                 Text('Helps with mood, anxiety and depression', textAlign: TextAlign.start, style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold, fontSize: 20,),),
                 Padding(padding: EdgeInsetsGeometry.all(3)),
                 Text('“Lavender is known for its ability to calm your nervous system, lift your mood and even lower blood pressure,” Dr. Lin points out.', textAlign:  TextAlign.justify, style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.normal, fontSize: 15),),
                 Padding(padding: EdgeInsetsGeometry.all(3)),
                 Text('“For example, lavender essential oil contains important compounds such as linalool, which has been shown to reduce anxiety and lower blood pressure.', textAlign:  TextAlign.justify, style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.normal, fontSize: 15),),
                 Padding(padding: EdgeInsetsGeometry.all(25)),
 
                 Text('Reference:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                 
                 Text('https://health.clevelandclinic.org/health-benefits-of-lavender'),
                  ],
              ),
              ),
              ),
              Padding(padding: EdgeInsets.all(50)),//spacee between objectsss
              
            ],
          ),
          ),
          )
         

          ),
    );
  }
}
