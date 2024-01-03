import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chatapp/auth/auth.dart';



import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key,});
  

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
   
    super.initState();
   Timer(const Duration(seconds: 4), () {
     Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx)=>Auth()));

    });
    
  }
 
   

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:const Color.fromARGB(255, 2, 47, 4).withOpacity(1),
      body:Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
       Row(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
         const Icon(Icons.chat_outlined,
          color: Colors.purple,
          size: 50,shadows: [BoxShadow(blurRadius: 30,
          color: Colors.purple)],
          ),
        const  SizedBox(width: 10,),
           Text("ToToK",
           style: GoogleFonts.gideonRoman(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold
           
           ),
           ),

         ],
       )
        ],
      )
    );
    
  }
}