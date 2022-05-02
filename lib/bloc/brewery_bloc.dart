import 'package:breweries/model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'brewery_event.dart';
part 'brewery_state.dart';

class BreweryBloc extends Bloc<BreweryEvent, BreweryState> {
  Brewery breweryObj = Brewery(id: '', name: '', city: '');
  BreweryBloc()
      : super(BreweryState(
            status: Status.initialized,
            breweryObj: Brewery(id: '', name: '', city: ''))) {
    on<Select>(_onSelect);
  }

  void _onSelect(Select event, emit) async {
    emit(BreweryState(status: Status.waiting, breweryObj: breweryObj));
    try {
      breweryObj = await getBrewery(event.id);
      emit(BreweryState(status: Status.success, breweryObj: breweryObj));
    } catch (e) {
      breweryObj = Brewery(id: event.id, name: '', city: '');
      emit(BreweryState(status: Status.failure, breweryObj: breweryObj));
    }
  }
}
