

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key,required this.Data,required this.title,required this.Discription});

   final String? Data;
   final String? title;
   final String? Discription;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 320,left: 10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.Discription.toString(),style: TextStyle(color: Colors.black),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 240,left: 10),
            child: Card(
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.title.toString(),style: TextStyle(color: Colors.black),),
              ),
            ),
          ),
          Positioned(
            child: Container(
              width: double.infinity,
              child: Image(
                fit: BoxFit.fill,
                  image: NetworkImage(widget.Data!)),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.menu,size: 28,color: Colors.white,),
              onPressed: () {
               Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.notification_add,size: 28,color: Colors.white,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
