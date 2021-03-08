import 'package:flutter/material.dart';
import 'package:page_flip/page_flip_builder.dart';
import 'package:page_flip/sign_in.dart';
import 'package:page_flip/sign_up.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pageBuilderKey = GlobalKey<PageFlipBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageFlipBuilder(
          key: pageBuilderKey,
          frontBuilder: (_) =>
              SignUp(onFlip: () => pageBuilderKey.currentState?.flip()),
          backBuilder: (_) =>
              SignIn(onFlip: () => pageBuilderKey.currentState?.flip())),
    );
  }
}
