import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_list_with_different_items/bloc/dash_board_bloc.dart';
import 'package:flutter_list_with_different_items/models/grade_model_class.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class GradeDashBoard extends StatelessWidget {
  const GradeDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBoardBloc, DashBoardState>(
      builder: (context, state) {
        if (state is DashBoardLoadedState) {
          GradeModelClass gradeModelClass = state.gradeModelClass;
          String differences = gradeModelClass.raise.toString();
          var percentValue =
              (gradeModelClass.balanceUSD / gradeModelClass.total) * 1;
          return Container(
            height: MediaQuery.of(context).size.height * 0.25,
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
                            .format(gradeModelClass.total) +
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
                                .format(gradeModelClass.raise) +
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
                  Transform.rotate(
                    angle: 180 * math.pi / 180,
                    child: LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width * 0.85,
                      lineHeight: 16.0,
                      percent: percentValue,
                      backgroundColor: Colors.indigo,
                      progressColor: Colors.teal[300],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "В акциях",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                          Text(
                            NumberFormat.decimalPattern()
                                    .format(gradeModelClass.stock) +
                                " \$",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                color: Colors.teal[300],
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Остаток USD",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                          Text(
                            NumberFormat.decimalPattern()
                                    .format(gradeModelClass.balanceUSD) +
                                " \$",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Остаток RUB",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                          Text(
                              NumberFormat.decimalPattern()
                                .format(gradeModelClass.balanceRUB)  + " ₽",
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
          "Оценка портфеля",
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
