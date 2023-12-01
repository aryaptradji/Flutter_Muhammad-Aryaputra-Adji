import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc() : super(PhotoInitialState()) {
    on<InitialPhotoEvent>((event, emit) {
      emit(PhotoInitialState());
    });

    on<ViewPhotoEvent>((event, emit) {
      if (state is PhotoLoadedState) {
        final state = this.state as PhotoLoadedState;
        final photo = state.photo;

        if (photo != null) {
          OpenFile.open(photo.files.first.path);
          emit(PhotoLoadedState(photo: photo));
        }
      }
    });

    on<ChoosePhotoEvent>((event, emit) async {
      if (state is PhotoLoadedState) {
        FilePickerResult? selectedPhoto =
            await FilePicker.platform.pickFiles(type: FileType.image);

        if (selectedPhoto != null) {
          emit(PhotoLoadedState(photo: selectedPhoto));
        }
      }
    });

    on<RemovePhotoEvent>((event, emit) {
      if (state is PhotoLoadedState) {
        emit(const PhotoLoadedState(photo: null));
      }
    });
  }
}
