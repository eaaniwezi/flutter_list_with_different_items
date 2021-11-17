part of 'dash_board_bloc.dart';

abstract class DashBoardState extends Equatable {
  const DashBoardState();

  @override
  List<Object> get props => [];
}

class DashBoardInitial extends DashBoardState {}

class DashBoardInitialState extends DashBoardState {}

class DashBoardLoadingState extends DashBoardState {}

class DashBoardLoadedState extends DashBoardState {
  final BonusModelClass bonusModelClass;
  final GradeModelClass gradeModelClass;
  final ProfitModelClass profitModelClass;
  final RefillModelClass refillModelClass;

  const DashBoardLoadedState({
    required this.bonusModelClass,
    required this.gradeModelClass,
    required this.profitModelClass,
    required this.refillModelClass,
  });
}

class DashBoardErrorState extends DashBoardState {
  final String error;

  const DashBoardErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
