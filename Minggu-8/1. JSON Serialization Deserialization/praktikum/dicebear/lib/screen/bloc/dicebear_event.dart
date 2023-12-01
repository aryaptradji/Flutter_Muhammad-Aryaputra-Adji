part of 'dicebear_bloc.dart';

abstract class DiceBearEvent extends Equatable {
  const DiceBearEvent();
}

class GetDiceBearEvent extends DiceBearEvent {
  final String avatarName;

  const GetDiceBearEvent({required this.avatarName});

  @override
  List<Object> get props => [avatarName];
}
