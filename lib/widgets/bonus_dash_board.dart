import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_list_with_different_items/bloc/dash_board_bloc.dart';
import 'package:flutter_list_with_different_items/models/bonus_model_class.dart';

class BonusDashBoard extends StatelessWidget {
  const BonusDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBoardBloc, DashBoardState>(
      builder: (context, state) {
       if (state is DashBoardLoadedState) {
          BonusModelClass bonusModelClass = state.bonusModelClass;
          return Container(
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _firstColumn(),
                  Row(
                    children: [
                      Text(
                        bonusModelClass.totalRUB.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 1,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "RUB",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.purple[200]!,
                            style: BorderStyle.solid,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "RUB",
                            style: TextStyle(
                              color: Colors.purple[200],
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                        "В команде",
                        style: TextStyle(color: Colors.black54, fontSize: 13),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Icon(
                              Icons.group_outlined,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            bonusModelClass.team.toString(),
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
                            child: Center(
                              child: SvgPicture.asset(
                                "icons/add.svg",
                                color: Colors.black.withOpacity(.5),
                              ),
                            ),
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
                            bonusModelClass.refillRUB.toString() + "₽",
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
                            bonusModelClass.refillUSD.toString() + "₽",
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
          "Ожидаемы бонус",
          style: TextStyle(color: Colors.black54, fontSize: 13),
        ),
        const Spacer(),
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
