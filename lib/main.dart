import 'package:flutter/material.dart';
import 'package:laporhoax/ui/home_page.dart';
import 'package:laporhoax/util/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lapor Hoax',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      initialRoute: HomePage.routeName,
      routes: routes,
    );
  }
}
