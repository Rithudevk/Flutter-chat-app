import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  var messagecontroller=TextEditingController();
  File? pickedimagefile;

  void message()async{
    final textMessage=messagecontroller.text;
    if(textMessage.trim().isEmpty){
          return ;
    }
    FocusScope.of(context).unfocus();
      messagecontroller.clear();

      final currentUser=FirebaseAuth.instance.currentUser;
      final userdata=await FirebaseFirestore.instance
      .collection('User_email')
      .doc(currentUser!.uid)
      .get();

         FirebaseFirestore.instance.collection('chat').add({
        'message':textMessage,
        'timestamp':Timestamp.now(),
        'userId':currentUser.uid,
        'username':userdata.data()!['username'],
        'image_url':userdata.data()!['image_url']
      });
    
  }

 

  
  @override
  Widget build(BuildContext context) {
    return
       Padding(
         padding: const EdgeInsets.all(12.0),
         child: Row(
          children: [
            Expanded(
              child: TextField(
                cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
                 controller:messagecontroller ,
                decoration: InputDecoration(
               
                  
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    
                  ),
                  label: Text('Text here...',
                 
                  style: TextStyle(
                    color: Colors.white,
                    
                  ),
                  ),
                   
                ),
                
              ),
              
            ),
          
          
            IconButton(onPressed: message, 
            icon: Icon(Icons.send,
            color: Colors.white
            ))
            
          ],
               ),
       );
    
  }
}