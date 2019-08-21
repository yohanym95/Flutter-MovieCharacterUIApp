import 'package:flutter/material.dart';
import 'package:flutter_uitest1/pages/CharacterHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(   
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        canvasColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.white,
        )
      ),
      home: MyHomePage(title: 'Movie Characters'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
        //   onPressed: (){
        //     Navigator.pop(context); 
        //   },
        // ),
        title: Text(widget.title,style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueAccent,
         actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search,color: Colors.white,),
          )
        ],
      ),
      body: CharcaterHomePage(),
    );
  }
}
