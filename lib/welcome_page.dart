import 'dart:async';

import 'package:flutter/material.dart';
import 'package:thien_220714/login_page.dart';
import 'package:thien_220714/transition/rotation_route.dart';
import 'package:thien_220714/transition/scale_rotate_route.dart';
import 'package:thien_220714/transition/scale_route.dart';
import 'package:thien_220714/transition/slide_route.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).push(ScaleRotateRoute(page: const LoginPage()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset('assets/starcity_logo.png'),
        ),
      )
    );
  }

}
