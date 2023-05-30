import 'dart:async';

import 'package:flutter/material.dart';

import '../../auth/presentation/view/sign_in.dart';
class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: FlutterLogo()),
      ),
    );
  }
}
