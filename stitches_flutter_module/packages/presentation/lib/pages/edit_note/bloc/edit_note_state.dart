part of 'edit_note_bloc.dart';

@immutable
abstract class EditNoteState {}

class EditNoteInitial extends EditNoteState {}

class EditNoteSuccess extends EditNoteState {}

class EditNoteFailed extends EditNoteState {}
