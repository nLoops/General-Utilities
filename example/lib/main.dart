import 'package:flutter/material.dart';
import 'package:general_utilities/general_utilities.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'General Utilities',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('General Utilities'),
      ),
      body: FooterLayout(body: DataLoadingWidget(title: 'Loading ....')
          , footer: Container(
          color: Colors.grey[100],
    height:  60.0,
    child: Center(
    child: RaisedButton(onPressed: (){},
    child: Text('Show snackbar!'),)),
    ),

    ),
    );
  }
}
