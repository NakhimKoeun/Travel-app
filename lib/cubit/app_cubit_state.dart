import 'package:travelapp/models/data_models.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubit.dart';
import 'package:travelapp/service/data_service.dart';

class AppCubits extends Cubit<CubitSates> {
  AppCubits({required this.data}) : super(InitialSate()) {
    emit(WelcomeSate());
  }
  final DataService data;
  late final places;

  void getData() async {
    try {
      emit(LoadingSate());
      places = await data.getInfo();
      emit(LoadedSate(places));
    } catch (e) {}
  }

  detaiPage(
    DataModels data,
  ) {
    emit(DetailSate(data));
  }

  goHome() {
    emit(LoadedSate(places));
  }
}
