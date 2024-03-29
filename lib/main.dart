import 'package:flutter/material.dart';
import 'package:thien_220714/login_page.dart';
import 'package:thien_220714/register_page.dart';
import 'package:thien_220714/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class UserInfo {
  static final _userInfo = UserInfo._internal();
  factory UserInfo() => _userInfo;
  UserInfo._internal();

  String userName = '';
  String userPhoneNumber = '';
  String userPassWord = '';
}



