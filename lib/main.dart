import 'package:breweries/bloc/brewery_bloc.dart';
import 'package:breweries/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BreweryBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Breweries Listing App',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
