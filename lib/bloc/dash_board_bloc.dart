import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_list_with_different_items/models/bonus_model_class.dart';
import 'package:flutter_list_with_different_items/models/grade_model_class.dart';
import 'package:flutter_list_with_different_items/models/profit_model_class.dart';
import 'package:flutter_list_with_different_items/models/refill_model_class.dart';
import 'package:flutter_list_with_different_items/repositories/dash_board_repository.dart';

part 'dash_board_event.dart';
part 'dash_board_state.dart';

class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardState> {
  DashBoardRepository dashBoardRepository;
  DashBoardBloc({
    required DashBoardState initialState,
    required this.dashBoardRepository,
  }) : super(initialState) {
    add(StartEvent());
  }
  @override
  Stream<DashBoardState> mapEventToState(DashBoardEvent event) async* {
    if (event is StartEvent) {
      try {
        yield DashBoardLoadingState();
        final GradeModelClass gradeModelClass =
            await dashBoardRepository.fetchingGrade();
        final BonusModelClass bonusModelClass =
            await dashBoardRepository.fetchingBonus();
        final ProfitModelClass profitModelClass =
            await dashBoardRepository.fetchingProfit();
        final RefillModelClass refillModelClass =
            await dashBoardRepository.fetchingRefill();
        yield DashBoardLoadedState(
            bonusModelClass: bonusModelClass,
            gradeModelClass: gradeModelClass,
            profitModelClass: profitModelClass,
            refillModelClass: refillModelClass);
      } catch (e) {
        yield DashBoardErrorState(error: e.toString());
      }
    }
  }
}
