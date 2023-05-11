part of 'note_list_bloc.dart';

@immutable
abstract class NoteListEvent {}

/// 加载笔记列表的事件
class LoadNoteListEvent extends NoteListEvent {}

/// 删除所有笔记的事件
class DeleteAllNotesEvent extends NoteListEvent {}
