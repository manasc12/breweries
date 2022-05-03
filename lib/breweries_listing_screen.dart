import 'package:breweries/bloc/brewery_bloc.dart';
import 'package:flutter/material.dart';
import 'package:breweries/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breweries/details_screen.dart';

//HomeScreen: This is the only one screen in the app which lists all the Breweries in a Scrollable List
class BreweriesListingScreen extends StatelessWidget {
  const BreweriesListingScreen({
    this.searchQuery = '',
    this.maxResults = 20,
    Key? key,
  }) : super(key: key);
  final String searchQuery;
  final int maxResults;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List of Breweries',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<Brewery>>(
          future: getBreweries(searchQuery, maxResults),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Brewery> allBreweriesList = snapshot.data!;
              return Scrollbar(
                child: ListView.builder(
                  itemCount: allBreweriesList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<BreweryBloc>(context)
                            .add(Select(allBreweriesList[index].id));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailsScreen(),
                            ));
                      },
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        selected: true,
                        selectedTileColor:
                            index % 2 != 0 ? Colors.amberAccent : Colors.white,
                        leading: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            child: const Image(
                              height: 30,
                              width: 30,
                              image: AssetImage("lib/assets/beer.png"),
                            )),
                        title: Text(
                          'Name: ' + allBreweriesList[index].name,
                          style: TextStyle(
                              color:
                                  index % 2 != 0 ? Colors.white : Colors.amber),
                        ),
                        trailing: Text('City: ' + allBreweriesList[index].city,
                            style: TextStyle(
                                color: index % 2 != 0
                                    ? Colors.white
                                    : Colors.amber)),
                      ),
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return ListView(children: [
                const ImageIcon(
                  AssetImage('lib/assets/beer.png'),
                  size: 150,
                  color: Colors.amberAccent,
                ),
                const Center(
                  child: Text(
                    "Error !!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "${snapshot.error}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )
              ]);
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
