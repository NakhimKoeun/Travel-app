import 'package:equatable/equatable.dart';
import 'package:travelapp/models/data_models.dart';

abstract class CubitSates extends Equatable {}

class InitialSate extends CubitSates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WelcomeSate extends CubitSates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingSate extends CubitSates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedSate extends CubitSates {
  LoadedSate(this.places);
  final List<DataModels> places;
  @override
  // TODO: implement props
  List<Object> get props => [places];
}

class DetailSate extends CubitSates {
  DetailSate(this.place);
  final DataModels place;
  @override
  // TODO: implement props
  List<Object> get props => [place];

  get detail => null;
}
