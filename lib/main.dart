import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_api/view.dart';


void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: Home(),));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List l=[];
  List location=[];
  List origin=[];
  Map m= {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 get_http();

  }
  get_http()
  async {
    var url = Uri.parse('https://rickandmortyapi.com/api/character');
    var response = await http.get(url);

    try {
      if(response.statusCode == 200)
        {
          final maindata=jsonDecode(response.body);
          l=maindata['results'];
          for(int i=0;i<l.length;i++)
            {
              location.add(l[i]['location']['name']);
              origin.add(l[i]['origin']['name']);

            }
          print("results : ${l}");
         setState(() {

         });
        }
      else {
        print(response.statusCode);
      }
    }
    on Exception catch(e)
    {
      print("Error "+e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("THE Rick And Morty Api"),


      ),
      drawer: Drawer(child: ListView.builder(itemCount: l.length,
        itemBuilder: (context, index) {
        return Card(color: Colors.grey,margin: EdgeInsets.all(5),
          child: ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return view(l[index]['name'],l[index]['image'],l[index]['gender'],l[index]['id'],l[index]['status']);
              },));
            },
            title: Text("${l[index]['name']}"),
            //leading: CircleAvatar(backgroundImage: FileImage(File("${l[index]['image']}"))),
          leading: Image.network("${l[index]['image']}"),
           // subtitle: Text("ID : ${l[index]['id']}\nstatus : ${l[index]['status']}"),
          ),
        );
      },),),



      body: ListView.builder(
        itemCount: l.length,
        itemBuilder: (context, index) {

          return Card(margin: EdgeInsets.all(5),child:
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return view(l[index]['name'],l[index]['image'],l[index]['gender'],l[index]['id'],l[index]['status']);
              },));
            },
            trailing: Text("${l[index]['gender']}"),
            leading: Image.network("${l[index]['image']}"),
            title:
            Text("Name : ${l[index]['name']}"),
          subtitle: Text("ID : ${l[index]['id']}\nstatus : ${l[index]['status']}"),

          ),);
      },),



    );
  }
}
