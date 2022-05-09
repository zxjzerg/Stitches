import 'package:bloc/bloc.dart';
import 'package:data/model/note.dart';
import 'package:data/repository/note/note_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'note_list_event.dart';
part 'note_list_state.dart';

class NoteListBloc extends Bloc<NoteListEvent, NoteListState> {
  NoteListBloc() : super(NoteListInitial()) {
    final repository = GetIt.I.get<NoteRepository>();

    on<LoadNoteListEvent>((event, emit) async {
      await repository
          .getNotes()
          .then((value) => emit(NoteListLoadSuccess(value)))
          .catchError((_) => emit(NoteListLoadFailed()));
    });

    on<DeleteAllNotesEvent>((event, emit) async {
      await repository
          .deleteAll()
          .then((value) => add(LoadNoteListEvent()))
          .catchError((_) => emit(NoteListLoadFailed()));
    });
  }
}
