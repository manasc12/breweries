import 'dart:ui';

import 'package:breweries/breweries_listing_screen.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';
  int _maxResults = 20;

  final _focusNode = FocusNode();
  final _searchQueryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Search Breweries'),
          ),
          body: ListView(
            children: [
              const SizedBox(
                height: 60,
              ),
              const Image(
                image: AssetImage("lib/assets/beer.png"),
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Search Query'),
                  focusNode: _focusNode,
                  controller: _searchQueryController,
                ),
              ),
              NumberPicker(
                minValue: 1,
                maxValue: 50,
                value: _maxResults,
                onChanged: (value) {
                  setState(() {
                    _maxResults = value;
                  });
                },
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => setState(() {
                    final newValue = _maxResults - 1;
                    _maxResults = newValue.clamp(1, 50);
                  }),
                ),
                Text(
                  'Max Results:  $_maxResults',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => setState(() {
                    final newValue = _maxResults + 1;
                    _maxResults = newValue.clamp(1, 50);
                  }),
                )
              ]),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.2),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      minimumSize: const Size(150, 40), //////// HERE
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return BreweriesListingScreen(
                            searchQuery: _searchQuery,
                            maxResults: _maxResults,
                          );
                        },
                      ));
                    },
                    child: const Text('Go')),
              )
            ],
          )),
      onTap: () {
        setState(() {
          _focusNode.unfocus();
        });
      },
    );
  }
}
