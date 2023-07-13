import 'package:flutter/material.dart';

import 'main.dart';

class view extends StatefulWidget {
  int? id;
  String? l;
  String? img;
  String? gender;
  String? status;

  view(this.l, this.img, this.gender, this.id, this.status);

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.l}"),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Home();
            },));

          }, icon: Icon(Icons.home))
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Home();
          },));
        },
        child: Icon(Icons.home, color: Colors.white, size: 29,),
        backgroundColor: Colors.black,
        tooltip: 'Home',
        elevation: 5,
        splashColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: Column(
        children: [
          Center(
              child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(5)),
            child: Image.network("${widget.img}"),
          )),
          Center(
              child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(5)),
            child: Text(
                "ID : ${widget.id}\nNAME : ${widget.l}\nGENDER : ${widget.gender}\nSTATUS : ${widget.status}",style: TextStyle(fontSize: 15,color: Colors.black),),
          ))
        ],
      ),
    );
  }
}
