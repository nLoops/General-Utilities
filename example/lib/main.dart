import 'package:example/empty_state_example.dart';
import 'package:example/footer_widget_example.dart';
import 'package:example/grid_view_example.dart';
import 'package:example/restart_widget_example.dart';
import 'package:flutter/material.dart';
import 'package:general_utilities/general_utilities.dart';

void main() {
  runApp(RestartWidget(child: MyApp()));
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
                        animationDirection: AnimationDirection.fade))),
            SpaceWidget(),
            RaisedButton(
                child: Text('Footer layout example'),
                onPressed: () => Navigator.of(context).push(
                    WidgetRouteAnimation(
                        builder: (_) => FooterWidgetExample(),
                        animationDirection:
                            AnimationDirection.from_top_to_bottom))),
            SpaceWidget(),
            RaisedButton(
                child: Text('Empty state example'),
                onPressed: () => Navigator.of(context).push(
                    WidgetRouteAnimation(
                        builder: (_) => EmptyStateExample(),
                        animationDirection:
                            AnimationDirection.from_bottom_to_top))),
            SpaceWidget(),
            RaisedButton(
                child: Text('Restart app'),
                onPressed: () => Navigator.of(context).push(
                    WidgetRouteAnimation(
                        builder: (_) => RestartWidgetExample(),
                        animationDirection:
                            AnimationDirection.from_bottom_to_top))),
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
            action: () => SnackBarWidget.hide(), actionTitle: 'HIDE');
      },
      child: Text('Show Snackbar widget'),
    );
  }
}
