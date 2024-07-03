import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key?key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text('Currency Converter', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
        height: h, width: w,
        decoration: BoxDecoration(
          image: DecorationImage(image:AssetImage('assets/background_image.jpg'),
          fit: BoxFit.cover,
          ),
          
        ),
        child: SingleChildScrollView(
          child: Form(key: formkey,
          
          ),
        ),
      ),
    );
  }
}