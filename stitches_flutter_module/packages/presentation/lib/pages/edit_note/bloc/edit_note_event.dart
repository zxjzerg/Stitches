part of 'edit_note_bloc.dart';

@immutable
class EditNoteEvent extends Equatable {
  final Note note;

  const EditNoteEvent(this.note);

  @override
  List<Object?> get props => [note];
}
