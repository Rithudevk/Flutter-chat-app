import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key,required this.onTAp});
  final void Function()onTAp;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 var emailControler=TextEditingController();
 var passWordcontroller=TextEditingController();

 void LogIn()async{
  try{
   await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailControler.text, 
    password: passWordcontroller.text);
  }on  FirebaseAuthException catch(error){
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
          vertical: 100,
          horizontal: 20
        ),
        child: SingleChildScrollView(
          child: Container(height: 500,
          width: 600,
          
          child: Card(
            elevation: 40,
            color:Colors.white,
             
              
              child: Container(
                   child: Form(child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.chat,
                      size: 60,
                      color: const Color.fromARGB(255, 98, 30, 110),
                      ),
                     Padding(
                       padding: const EdgeInsets.all(13.0),
                       child: Container(
                         child: Column(
                           children: [
                             TextField(
                                  
                                   controller: emailControler,
                                  decoration: InputDecoration(
                                    label: Text('EmailAddress'),
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
                                  controller:passWordcontroller ,
                                   obscureText: true,
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
                                TextButton(onPressed: LogIn,
                                 child: Text('Login',
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
                                            Text('No account?',
                                            style:  GoogleFonts.alice(
                                         fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                         
                                        ) ,),
                                        TextButton(onPressed:widget.onTAp,
                                        child: Text(
                                        'Register Now'
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
      ) ;
    
  }
}