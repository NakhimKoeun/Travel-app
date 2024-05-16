import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubit_logic.dart';
import 'package:travelapp/cubit/app_cubit_state.dart';
import 'package:travelapp/service/data_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Your App Title',
        theme: ThemeData(
            // Define your app's theme here
            ),
        home: BlocProvider<AppCubits>(
          create: (context) => AppCubits(
            data: DataService(),
          ),
          child: AppCubitLogic(),
        ) // Your DetailScreen widget as the home
        );
  }
}
