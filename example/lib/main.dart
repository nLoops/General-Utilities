import 'package:example/grid_view_example.dart';
import 'package:flutter/material.dart';
import 'package:general_utilities/general_utilities.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      body: Container(
        margin: const EdgeInsets.only(top: kDimenNormal),
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _showLoadingIndicator(),
            SpaceWidget(),
            _showSnackBar(),
            SpaceWidget(),
            RaisedButton(
                child: Text('Grid view example'),
                onPressed: () => Navigator.of(context).push(
                    WidgetRouteAnimation(
                        builder: (_) => GridViewExample(),
                        animationDirection: AnimationDirection.fade)))
          ],
        )),
      ),
    );
  }

  RaisedButton _showLoadingIndicator() {
    return RaisedButton(
      onPressed: () {
        // Show indicator
        LoadingIndicator.show(context);

        // Mock latency and hide it
        Future.delayed(Duration(seconds: 3), () => LoadingIndicator.hide());
      },
      child: Text('Show Loading Indicator'),
    );
  }

  RaisedButton _showSnackBar() {
    return RaisedButton(
      onPressed: () {
        // Show snackbar and action to hide it
        SnackBarWidget.show(context, 'Hello World!',
            action: () => SnackBarWidget.hide(),
            actionTitle: 'HIDE',
            backgroundColor: Colors.black54);
      },
      child: Text('Show Snackbar widget'),
    );
  }
}
