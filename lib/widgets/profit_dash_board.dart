import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_list_with_different_items/bloc/dash_board_bloc.dart';
import 'package:flutter_list_with_different_items/models/profit_model_class.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ProfitDashBoard extends StatelessWidget {
  const ProfitDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBoardBloc, DashBoardState>(
      builder: (context, state) {
        if (state is DashBoardLoadedState) {
          ProfitModelClass profitModelClass = state.profitModelClass;
          String differences = profitModelClass.raise.toString();
          return Container(
 height: MediaQuery.of(context).size.height * 0.27,
            decoration: BoxDecoration(
              color: Colors.teal[50],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _firstColumn(),
                  Text(
                    NumberFormat.decimalPattern()
                            .format(profitModelClass.total) +
                        " \$",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        NumberFormat.decimalPattern()
                                .format(profitModelClass.raise) +
                            "%",
                        style: TextStyle(
                          color: differences.contains("-")
                              ? Colors.red
                              : Colors.green,
                          fontSize: 13,
                        ),
                      ),
                      SvgPicture.asset(
                        "icons/arrow.svg",
                        color: differences.contains("-")
                            ? Colors.red
                            : Colors.green,
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Ивестировано",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                          Text(
                            NumberFormat.decimalPattern()
                                    .format(profitModelClass.invest) +
                                " \$",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Общая стоимость",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                          Text(
                            NumberFormat.decimalPattern()
                                    .format(profitModelClass.price) +
                                " \$",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        } else if (state is DashBoardErrorState) {
          // String error = state.error;
          return const Center(child: Text("Oops"));
        } else {
          return const Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.purple,
          ));
        }
      },
    );
  }

  _firstColumn() {
    return Row(
      children: [
        const Text(
          "Прибыль с акций",
          style: TextStyle(color: Colors.black54, fontSize: 13),
        ),
        Spacer(),
        Transform.rotate(
          angle: 180 * math.pi / 180,
          child: const Icon(
            Icons.info_outline_rounded,
            color: Colors.black26,
            size: 23,
          ),
        ),
      ],
    );
  }
}
