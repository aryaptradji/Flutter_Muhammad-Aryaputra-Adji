part of 'date_bloc.dart';

abstract class DateState extends Equatable {
  const DateState();
  
  @override
  List<Object> get props => [];
}

class DateInitial extends DateState {}
