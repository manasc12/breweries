import 'package:breweries/bloc/brewery_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brewery Details'),
      ),
      body: Center(
        child: BlocBuilder<BreweryBloc, BreweryState>(
          builder: (context, breweryState) {
            if (breweryState.status == Status.success) {
              return Scrollbar(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[300],
                      child: const Image(
                        width: 60,
                        height: 60,
                        image: AssetImage("lib/assets/beer.png"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: buildText('ID', context),
                      trailing: buildText(breweryState.breweryObj.id, context),
                    ),
                    ListTile(
                      title: buildText('NAME', context),
                      trailing:
                          buildText(breweryState.breweryObj.name, context),
                    ),
                    ListTile(
                      title: buildText('CITY', context),
                      trailing:
                          buildText(breweryState.breweryObj.city, context),
                    ),
                    ListTile(
                      title: buildText('BREWERY TYPE', context),
                      trailing: buildText(
                          breweryState.breweryObj.breweryType ?? 'NULL',
                          context),
                    ),
                    ListTile(
                      title: buildText('STREET', context),
                      trailing: buildText(
                          breweryState.breweryObj.street ?? 'NULL', context),
                    ),
                    ListTile(
                      title: buildText('STATE', context),
                      trailing: buildText(
                          breweryState.breweryObj.state ?? 'NULL', context),
                    ),
                    ListTile(
                      title: buildText('POSTAL CODE', context),
                      trailing: buildText(
                          breweryState.breweryObj.postalCode ?? 'NULL',
                          context),
                    ),
                    ListTile(
                      title: buildText('COUNTRY', context),
                      trailing: buildText(
                          breweryState.breweryObj.country ?? 'NULL', context),
                    ),
                    ListTile(
                      title: buildText('PHONE', context),
                      trailing: buildText(
                          breweryState.breweryObj.phone ?? 'NULL', context),
                    ),
                    ListTile(
                      title: buildText('WEBSITE', context),
                      trailing: buildText(
                          breweryState.breweryObj.websiteUrl ?? 'NULL',
                          context),
                    ),
                  ],
                ),
              );
            } else if (breweryState.status == Status.failure) {
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
                  'Failed to load the Brewery: ' + breweryState.breweryObj.id,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )
              ]);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  SizedBox buildText(String text, BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width * 0.60,
        child: Text(
          text,
        ),
      );
}
