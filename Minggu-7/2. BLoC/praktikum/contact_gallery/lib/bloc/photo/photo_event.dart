part of 'photo_bloc.dart';

abstract class PhotoEvent extends Equatable {
  const PhotoEvent();

  @override
  List<Object?> get props => [];
}

class InitialPhotoEvent extends PhotoEvent {}

class ViewPhotoEvent extends PhotoEvent {}

class ChoosePhotoEvent extends PhotoEvent {}

class RemovePhotoEvent extends PhotoEvent {}
