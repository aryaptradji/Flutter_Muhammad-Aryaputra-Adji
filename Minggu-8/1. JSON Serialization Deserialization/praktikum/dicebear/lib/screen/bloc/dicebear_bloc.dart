import 'package:dicebear/services/dicebear_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dicebear_event.dart';
part 'dicebear_state.dart';

class DiceBearBloc extends Bloc<DiceBearEvent, DiceBearState> {
  DiceBearBloc() : super(DicebearInitial()) {
    on<GetDiceBearEvent>((event, emit) async {
      // Loading State
      emit(DiceBearLoadingState());
      // Success State
      try {
        final diceBearImage = await Future.delayed(
          const Duration(seconds: 1),
          () => DiceBearServices.getDiceBear<String>(
              avatarName: event.avatarName),
        );

        emit(
          DiceBearLoadedSuccess(
              snackBarMessage: 'Avatar Changed Successfully!',
              diceBearImage: diceBearImage),
        );
      } catch (e) {
        // Failed State
        emit(const DiceBearLoadedFailed(
            messageError: 'Oops! Connection is lost'));
      }
    });
  }
}
