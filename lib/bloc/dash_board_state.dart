part of 'dash_board_bloc.dart';

abstract class DashBoardState extends Equatable {
  const DashBoardState();
  
  @override
  List<Object> get props => [];
}

class DashBoardInitial extends DashBoardState {}