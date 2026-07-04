import 'package:flutter/material.dart';

class NetflixhomeScreen extends StatefulWidget {
  const NetflixhomeScreen({super.key});

  @override
  State<NetflixhomeScreen> createState() => _NetflixhomeScreenState();
}

class _NetflixhomeScreenState extends State<NetflixhomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,children: [SizedBox(height: 50,),Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
        child: Row(children: [],),)],
    ),);
  }
}