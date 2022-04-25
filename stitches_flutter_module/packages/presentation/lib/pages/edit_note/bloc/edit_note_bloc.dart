import 'package:bloc/bloc.dart';
import 'package:data/model/note.dart';
import 'package:data/repository/note/note_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'edit_note_event.dart';
part 'edit_note_state.dart';

class EditNoteBloc extends Bloc<EditNoteEvent, EditNoteState> {
  EditNoteBloc() : super(EditNoteInitial()) {
    final repository = GetIt.I.get<NoteRepository>();

    on<EditNoteEvent>((event, emit) async {
      await repository
          .saveNote(event.note)
          .then((value) => emit(EditNoteSuccess()))
          .catchError((_) => emit(EditNoteFailed()));
    });
  }
}
