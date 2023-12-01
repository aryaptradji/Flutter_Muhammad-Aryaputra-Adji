part of 'photo_bloc.dart';

abstract class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => [];
}

class PhotoInitialState extends PhotoState {}

class PhotoLoadedState extends PhotoState {
  final FilePickerResult? photo;

  const PhotoLoadedState({required this.photo});

  @override
  List<Object> get props => [photo ?? " "];
}
