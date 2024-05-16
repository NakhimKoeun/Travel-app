import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubit.dart';
import 'package:travelapp/cubit/app_cubit_state.dart';
import 'package:travelapp/screen/Page_screen.dart';
import 'package:travelapp/screen/detial.dart';
import 'package:travelapp/screen/home_screen.dart';
import 'package:travelapp/screen/navpages/main_screen.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({super.key});

  @override
  State<AppCubitLogic> createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitSates>(
        builder: (context, state) {
          if (state is DetailSate) {
            return DetailScreen();
          }
          if (state is WelcomeSate) {
            return PageScreen();
          }
          if (state is LoadedSate) {
            return const MianScreen();
          }
          if (state is LoadingSate) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
