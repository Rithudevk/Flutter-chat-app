import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatapp/widget/chatmessage.dart';
import 'package:flutter_chatapp/widget/newmsg.dart';
import 'package:google_fonts/google_fonts.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
      appBar: PreferredSize(
            preferredSize: Size.fromRadius(50),

             child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(10, 10),

                )
              ,
               child: AppBar(
                centerTitle: true,
                backgroundColor: Color.fromARGB(255, 27, 61, 28),
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
             ),
           ),
          body: Column(
        children: [
          Expanded(
            child: ChatMessage()),

          NewMessage()
        ],
      )
        );
    
    
  }
}