import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

//Function to get Breweries from the API
Future<List<Brewery>> getBreweries(String searchQuery, int maxResults) async {
  List<Brewery> breweriesList = [];
  Uri uri = searchQuery.isEmpty
      ? Uri.parse(
          'https://api.openbrewerydb.org/breweries?per_page=$maxResults')
      : Uri.parse(
          'https://api.openbrewerydb.org/breweries/search?query=$searchQuery&per_page=$maxResults');
  final response = await http.get(uri, headers: {"Accept": "application/json"});

  if (response.statusCode == 200) {
    for (var res in json.decode(response.body)) {
      breweriesList.add(Brewery(
          id: res['id'],
          name: res['name'] ?? 'NULL',
          city: res['city'] ?? 'NULL'));
    }
    return breweriesList;
  } else {
    throw Exception(
        'Failed to load the Breweries List! Please check your connection!');
  }
}

//Function to get a single selected Brewery from the API
Future<Brewery> getBrewery(String id) async {
  final response = await http.get(
      Uri.parse('https://api.openbrewerydb.org/breweries/' + id),
      headers: {"Accept": "application/json"});

  if (response.statusCode == 200) {
    Map<String, dynamic> res = json.decode(response.body);
    return Brewery.details(
        id: res['id'],
        name: res['name'] ?? 'NULL',
        city: res['city'] ?? 'NULL',
        breweryType: res['brewery_type'],
        street: res['street'],
        state: res['state'],
        postalCode: res['postal_code'],
        country: res['country'],
        phone: res['phone'],
        websiteUrl: res['website_url']);
  } else {
    throw Exception('Failed to load the Brewery: $id!');
  }
}

//Model for each Brewery in a Brewery List
class Brewery {
  final String id;
  final String name;
  final String city;
  String? breweryType;
  String? street;
  String? state;
  String? postalCode;
  String? country;
  String? phone;
  String? websiteUrl;

  Brewery({required this.id, required this.name, required this.city});
  Brewery.details(
      {required this.id,
      required this.name,
      required this.city,
      this.breweryType,
      this.street,
      this.state,
      this.postalCode,
      this.country,
      this.phone,
      this.websiteUrl});
}
