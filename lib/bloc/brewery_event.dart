part of 'brewery_bloc.dart';

abstract class BreweryEvent extends Equatable {
  const BreweryEvent();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Init extends BreweryEvent {
  const Init();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Select extends BreweryEvent {
  final String id;

  const Select(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
