import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Usage Analytics App',
      theme: ThemeData(
        primarySwatch: Colors.green, //Primary color scheme to be followed through app can be set here
      ),
      home: MyHomePage(title: 'Usage Analytics Tracker'),
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
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: new Drawer( //Code for the Side Drawer in the app
          child: new ListView(
              children: <Widget>[
                new DrawerHeader( //Code for the header of drawer, may contain optional image
                  child: new Text('Usage Analytics App'),
                ),
                new ListTile( //List item that takes you back to the home page
                  title: new Text('Home'),
                  onTap: () {},
                ),
                new Divider(), //Divider to look clean
                new ListTile( //List tile item for about
                  title: new Text('About'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(title: Text('About')),
                          body: Center(

                            child: RaisedButton(
                              child: Text('Home'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),

                        );
                      },
                    ));
                  },
                ),
                new Divider(),
              ]
          )
      ),
      body: Center(

        child: Column( //Columns allow for multiple widgets, one after the other
          mainAxisAlignment: MainAxisAlignment.center, //Column is set to be center aligned.
          children: <Widget>[
            RichText( //RichText allows for better text formatting and custom styles per text block
              text: TextSpan(
                text: 'Welcome to the Usage Analytics App! ',
                style: TextStyle(fontSize: 25.0, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(text: 'This page is a demo of the Column element of flutter. ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'Press that button down below to increase the counter.', style: TextStyle(fontStyle: FontStyle.italic)),
                ],
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
