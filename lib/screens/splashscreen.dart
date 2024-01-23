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
   Timer(const Duration(seconds: 5), () {
     Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx)=>Auth()));

    });
    
  }
 
   

  @override
  Widget build(BuildContext context) {
    return  Container(
     decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
       const Color.fromARGB(255, 0, 54, 99),
       const Color.fromARGB(255, 43, 56, 79)

       
      ])
     ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
       appBar: AppBar(
        backgroundColor: Colors.transparent,
       ),
        body: Center(
          child: Container(
            child: Text('Hello..!',
            style: GoogleFonts.lancelot(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
           shadows: <Shadow>[Shadow(
            color: Colors.white,
            blurRadius: 20,
           
           )]
            ),

            ),

          ),
        ), 
      ),
    );
    
  }
}