import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_list_with_different_items/bloc/dash_board_bloc.dart';
import 'package:flutter_list_with_different_items/repositories/dash_board_repository.dart';
import 'package:flutter_list_with_different_items/screen/main_screen.dart';

void main() {
  final dashBoardRepository = DashBoardRepository();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<DashBoardBloc>(create: (context) {
        return DashBoardBloc(
            dashBoardRepository: dashBoardRepository,
            initialState: DashBoardInitialState());
      }),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MainScreen(),
    );
  }
}
