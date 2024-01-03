import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatapp/widget/imagepicker.dart';
import 'package:google_fonts/google_fonts.dart';

class Reg extends StatefulWidget {
  const Reg({super.key,required this.onTap});
  final void Function()onTap;

  @override
  State<Reg> createState() => _RegState();
}

class _RegState extends State<Reg> {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var usernameController=TextEditingController();
  File?pickedimagefile;

  void SingnIN()async{
    try{
    final UserCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text) ;

     final storage=FirebaseStorage.instance.ref()
     .child('User_image')
     .child('${UserCredential.user!.uid}.jpg');
     await storage.putFile(pickedimagefile!);
    final imageurl=await storage.getDownloadURL();

    await FirebaseFirestore.instance.collection('User_email')
     .doc(UserCredential.user!.uid)
     .set({
      'useremail':emailController.text,
      'username':usernameController.text,
      'image_url':imageurl

     });

    }on FirebaseException catch(error){
      displayerror(error.code);

    }
  }

  void displayerror(String message){
     showDialog(context: context, 
     builder: (ctx)=>AlertDialog(title: Text(message),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:const Color.fromARGB(255, 2, 47, 4).withOpacity(1),
      body:Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 80,
          horizontal: 20
        ),
        child: SingleChildScrollView(
          child: Container(height: 700,

          width: 600,
          
          child: Card(
            elevation: 40,
            color:Colors.white,
             
              
              child: Container(
                   child: Form(child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                     
                     Padding(
                       padding: const EdgeInsets.all(13.0),
                       child: Container(
                         child: Column(
                           children: [
                            PickiedImage(onTap: (pickedimage){
                              pickedimagefile=pickedimage;
                            }),
                             TextField(
                                  controller: emailController,
                                   
                                  decoration: InputDecoration(
                                    label: Text('EmailAddress'),
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                             
                                    borderRadius: BorderRadius.circular(20),
                             
                                   
                                    )
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                  
                                ),
                                   TextField(
                                  
                                  controller: usernameController,
                                  decoration: InputDecoration(
                                    
                                    label: Text('UserName'),
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                   
                                    borderRadius: BorderRadius.circular(10),
                             
                                   
                                    )
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                  TextField(
                                   obscureText: true,
                                   controller: passwordController,
                                  decoration: InputDecoration(
                                    label: Text('Password'),
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                             
                                    borderRadius: BorderRadius.circular(10),
                             
                                   
                                    )
                                  ),
                                ),
                                 SizedBox(
                                  height: 10,
                                ),
 

                                TextButton(onPressed:SingnIN,
                                 child: Text('SignUp',
                                 style: GoogleFonts.aDLaMDisplay(
                                  fontSize: 30,
          
                                 ),
                                 )
                                 ),
                                    SizedBox(
                                  height: 10,
                                ),
                                Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('Already have an account?',
                                            style:  GoogleFonts.alice(
                                         fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                         
                                        ) ,),
                                        TextButton(onPressed: widget.onTap,child: Text(
                                        'Login Now'
                                        ,
                                        style:   GoogleFonts.alice(
                                         
                                          fontWeight: FontWeight.w700,
                                          
                                        ),
                                        ))
          
          
                       
                           ],
                         ),
                           ]
                       ),
                     ),
                     )
                    ]
                      )
                    
                   )),
              ),
            ),
        ),
        ),
    );
  }
}