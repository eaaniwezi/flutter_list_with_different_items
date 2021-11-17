// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_list_with_different_items/bloc/dash_board_bloc.dart';
import 'package:flutter_list_with_different_items/widgets/bonus_dash_board.dart';
import 'package:flutter_list_with_different_items/widgets/grade_dash_board.dart';
import 'package:flutter_list_with_different_items/widgets/profit_dash_board.dart';
import 'package:flutter_list_with_different_items/widgets/refill_dash_board.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<DashBoardBloc, DashBoardState>(
        builder: (context, state) {
          if (state is DashBoardLoadingState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.purple),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Loading..."),
                  )
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                const GradeDashBoard(),
                const SizedBox(height: 10),
                const RefillDashBoard(),
                const SizedBox(height: 10),
                const ProfitDashBoard(),
                const SizedBox(height: 10),
                const BonusDashBoard(),
                const SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}
