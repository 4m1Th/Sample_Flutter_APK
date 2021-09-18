import 'package:apk2/homepage.dart';
import 'package:apk2/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";

void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  //This widget is the root of the application
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Landingpage(),

    );
  }
}

class Landingpage extends StatelessWidget {

  final Future<FirebaseApp> _initialization=Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        if(snapshot.hasError){

          return Scaffold(
            body: Center(
              child: Text("Error: ${snapshot.error}"),
            ),
          );
        }
        if(snapshot.connectionState==ConnectionState.done){
          return StreamBuilder(
           stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot){
             if(snapshot.connectionState==ConnectionState.active){
               Object? user = snapshot.data;


               if(user == null){

                 return Loginpage();

               }else{
                 return Homepage();

               }
             }
             return Scaffold(
               body: Center(
                   child: Text("Checking login....")
               ),
             );

            },
          );
        }

        return Scaffold(
          body: Center(
            child: Text("Connecting to the app...")
          ),
        );
      },

    );
  }
}
