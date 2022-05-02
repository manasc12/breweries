part of 'brewery_bloc.dart';

enum Status { waiting, success, failure, initialized }

class BreweryState extends Equatable {
  final Status status;
  final Brewery breweryObj;

  const BreweryState({required this.status, required this.breweryObj});

  @override
  // TODO: implement props
  List<Object?> get props => [status];
}
