import 'package:flutter/material.dart';

// 自定义基础部件
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // color: Colors.deepPurpleAccent,
        padding: const EdgeInsets.all(60),
        width: 350,
        height: 350,
        // transform: Matrix4.rotationZ(0.5),
        // transformAlignment: Alignment.topRight,
        decoration: const BoxDecoration(
          color: Colors.deepPurpleAccent,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.orange,
              Colors.cyan,
              Colors.pink,
              Colors.brown
            ]
          ), 
          image: DecorationImage(
            image: NetworkImage(
              'https://resources.ninghao.net/images/IMG_2626.JPG',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.deepOrange, BlendMode.softLight),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(25)
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.deepOrangeAccent,
              offset: Offset(5, 20),
              blurRadius: 30,
            )
          ]
        ),
        child: Image.asset(
          'assets/images/logo.png',
          width: 96,
          color: Colors.white,
        ),
      ),
    );
  }
}