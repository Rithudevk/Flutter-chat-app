import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatapp/widget/message_buble.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
        stream:FirebaseFirestore.instance
        .collection('chat')
        .orderBy('timestamp',
        descending: true)
        .snapshots() ,
        builder:(ctx,chatsnapshot){
          if(chatsnapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(chatsnapshot.data!.docs.isEmpty){
            return Center(
               child: Text('no message send'),
            );
            
          }
          final loadedMessage=chatsnapshot.data!.docs;
          final currentuser=FirebaseAuth.instance.currentUser;
          return ListView.builder(
            reverse: true,
            padding: EdgeInsets.only(
              left: 13,
              right: 13,
              bottom: 40
            ),
            itemBuilder:(ctx,index){
              final chatMessage=loadedMessage[index].data();
              final nextMessage=index+1<loadedMessage.length
              ?loadedMessage[index+1].data()
              :null;
              final currentMsgUserId=chatMessage['userId'];
              final nextMsgUserId=nextMessage!=null
              ?nextMessage['userId']
              :null;
              final nextUserIsSame=nextMsgUserId==currentMsgUserId;
              if(nextUserIsSame){
                return MessageBubble.next(message: chatMessage['message'],
                 isMe: nextMsgUserId==currentuser!.uid);
              }else{
                return MessageBubble.first(userImage:chatMessage['image_url'],
                 username: chatMessage['username'], 
                 message:chatMessage['message'], 
                 isMe: currentMsgUserId==currentuser!.uid);
              }
              
            },
            itemCount:loadedMessage.length ,
             );
        } ,
        
      ),
    );
  }
}