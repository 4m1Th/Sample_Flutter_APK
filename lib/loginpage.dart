import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {


  late String _email;
  late String _password;

  //Account Creation
  Future<void> _createuser() async{

    print("Email:$_email Password:$_password");
    try{
      UserCredential userCredential = await FirebaseAuth
          .instance
          .createUserWithEmailAndPassword(email: _email, password: _password);


    }on FirebaseAuthException catch(e){
      print("Error...:$e");
    }catch(e){
      print("Eror..:$e");
    }

  }


  //Account Login
  Future<void> _login() async{

    print("Email:$_email Password:$_password");
    try{
      UserCredential userCredential = await FirebaseAuth
          .instance
          .signInWithEmailAndPassword(email: _email, password: _password);


    }on FirebaseAuthException catch(e){
      print("Error...:$e");
    }catch(e){
      print("Eror..:$e");
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value){
                _email=value;
              },
              decoration: InputDecoration(
                hintText: "Enter email..."
              ),
            ),
            TextField(
              onChanged: (value){
                _password=value;
              },
              decoration: InputDecoration(
                  hintText: "Enter password..."
              ),
            ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               MaterialButton(
                 onPressed: _login,
                 child: Text("Login"),
               ),
               MaterialButton(
                 onPressed: _createuser,
                 child: Text("Create new account"),
               )
             ],

           )
          ],
        ),
        ),
    );
  }
}
