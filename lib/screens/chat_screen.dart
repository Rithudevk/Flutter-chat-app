import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatapp/widget/chatmessage.dart';
import 'package:flutter_chatapp/widget/newmsg.dart';
import 'package:google_fonts/google_fonts.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [
         const Color.fromARGB(255, 0, 54, 99),
       const Color.fromARGB(255, 43, 56, 79)

      ])
    ),
      child: Scaffold(
       extendBodyBehindAppBar: true,
       backgroundColor: Colors.transparent,
        appBar:  AppBar(
                  centerTitle: true,
                  backgroundColor:Colors.transparent,
                 title: Text('chats',
                 style: GoogleFonts.aDLaMDisplay(
                 color: Color.fromARGB(209, 255, 255, 255),
                  fontSize: 30,
                   
                           
                 ),
      
                 ),
                  actions: [
                    IconButton(onPressed: (){
                      FirebaseAuth.instance.signOut();
                    }, icon: Icon(Icons.exit_to_app,
                    color: Colors.white,
                    size: 30,
      
                    ))
                  ],
                           
                           ),
                            body: Column(
        children: [
          Expanded(
            child: ChatMessage()),

          NewMessage()
        ],
      )
               ),
    );
     
    
  }
}