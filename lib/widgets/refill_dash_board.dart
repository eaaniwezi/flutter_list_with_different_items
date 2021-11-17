import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_list_with_different_items/bloc/dash_board_bloc.dart';
import 'package:flutter_list_with_different_items/models/refill_model_class.dart';
import 'package:logger/logger.dart';

class RefillDashBoard extends StatelessWidget {
  const RefillDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBoardBloc, DashBoardState>(
      builder: (context, state) {
        if (state is DashBoardLoadedState) {
          RefillModelClass refillModelClass = state.refillModelClass;
          return Container(
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              color: Colors.indigo[200],
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
                            .format(refillModelClass.total) +
                        " \$",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                        "Выведено",
                        style: TextStyle(color: Colors.black54, fontSize: 13),
                      ),
                      Row(
                        children: [
                          Text(
                            NumberFormat.decimalPattern()
                                    .format(refillModelClass.refillUSD) +
                                " \$",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Icon(Icons.add),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Пополнено RUB",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                          Text(
                            NumberFormat.decimalPattern()
                                    .format(refillModelClass.refillRUB) +
                                " ₽",
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
                            "Выведено RUB",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                          Text(
                            NumberFormat.decimalPattern()
                                    .format(refillModelClass.withdrawn) +
                                " ₽",
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
          "Пополнено",
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
