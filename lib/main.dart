import 'package:flutter/material.dart';
import 'package:breweries/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Breweries Listing App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomeScreen(),
    );
  }
}
