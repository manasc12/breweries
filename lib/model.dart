import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:breweries/constants.dart';

//Function to get Breweries from the API
Future<List<Brewery>> getBreweries() async {
  List<Brewery> breweriesList = [];
  final response = await http.get(url, headers: {"Accept": "application/json"});

  if (response.statusCode == 200) {
    for (var res in json.decode(response.body)) {
      breweriesList.add(
          Brewery(name: res['name'] ?? 'NULL', city: res['city'] ?? 'NULL'));
    }
    return breweriesList;
  } else {
    throw Exception(
        'Failed to load the Breweries List! Please check your connection!');
  }
}

//Model for each Brewery in a Brewery List
class Brewery {
  final String name;
  final String city;

  Brewery({required this.name, required this.city});
}
