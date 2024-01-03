import 'package:flutter/material.dart';
import 'package:flutter_chatapp/screens/login_screen.dart';
import 'package:flutter_chatapp/screens/reg_screen.dart';

class AutheScreen extends StatefulWidget {
  const AutheScreen({super.key});

  @override
  State<AutheScreen> createState() => _AutheScreenState();
}

class _AutheScreenState extends State<AutheScreen> {
 bool isLogin=true;
 void toggleScreen(){
setState(() {
  isLogin=!isLogin;
});
 }
  @override
  Widget build(BuildContext context) {
    if(isLogin){
      return LoginScreen(onTAp: toggleScreen);
    }else{
     return Reg(onTap: toggleScreen);
    }
  }
}