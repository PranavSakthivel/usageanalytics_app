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

        primarySwatch: Colors.green,
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
      drawer: new Drawer(
          child: new ListView(
              children: <Widget>[
                new DrawerHeader(
                  child: new Text('Usage Analytics App'),
                ),
                new ListTile(
                  title: new Text('Home'),
                  onTap: () {},
                ),
                new Divider(),
                new ListTile(
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

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: 'Welcome to the Usage Analytics App! ',
                style: /*DefaultTextStyle.of(context).style*/TextStyle(fontSize: 25.0, color: Colors.black),
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
