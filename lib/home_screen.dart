import 'package:flutter/material.dart';
import 'package:breweries/model.dart';

//HomeScreen: This is the only one screen in the app which lists all the Breweries in a Scrollable List
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

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
          future: getBreweries(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Brewery> allBreweriesList = snapshot.data!;
              return Scrollbar(
                child: ListView.builder(
                  itemCount: allBreweriesList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      selected: true,
                      selectedTileColor:
                          index % 2 != 0 ? Colors.amberAccent : Colors.white,
                      leading: Icon(
                        Icons.wine_bar_rounded,
                        color: index % 2 != 0 ? Colors.white : Colors.amber,
                      ),
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
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return ListView(children: [
                const Icon(
                  Icons.wine_bar_rounded,
                  size: 100,
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
