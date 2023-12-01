part of 'dicebear_bloc.dart';

abstract class DiceBearState extends Equatable {
  const DiceBearState();
}

class DicebearInitial extends DiceBearState {
  @override
  List<Object> get props => [];
}

class DiceBearLoadingState extends DiceBearState {
  @override
  List<Object> get props => [];
}

class DiceBearLoadedSuccess extends DiceBearState {
  final String diceBearImage;
  final String snackBarMessage;

  const DiceBearLoadedSuccess({
    required this.snackBarMessage,
    required this.diceBearImage,
  });

  @override
  List<Object> get props => [diceBearImage, snackBarMessage];
}

class DiceBearLoadedFailed extends DiceBearState {
  final String messageError;

  const DiceBearLoadedFailed({required this.messageError});

  @override
  List<Object> get props => [messageError];
}
