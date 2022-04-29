part of 'note_list_bloc.dart';

@immutable
abstract class NoteListState extends Equatable {
  final List<Note> notes;

  const NoteListState(this.notes);

  @override
  List<Object?> get props => [notes];
}

class NoteListInitial extends NoteListState {
  NoteListInitial() : super([]);
}

class NoteListLoadSuccess extends NoteListState {
  const NoteListLoadSuccess(List<Note> notes) : super(notes);
}

class NoteListLoadFailed extends NoteListState {
  NoteListLoadFailed() : super([]);
}
