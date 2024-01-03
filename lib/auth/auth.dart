import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatapp/auth/screen_auth.dart';
import 'package:flutter_chatapp/screens/chat_screen.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), 
      builder: (context,snapshot){
        if(snapshot.hasData){
           return ChatScreen();
        }else{
          return AutheScreen();
        }
      }),
    );
  }
}