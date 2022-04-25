import 'package:data/model/note.dart';

/// 记事本的数据操作方法的接口
abstract class NoteRepository {
  /// 获取所有的记事
  Future<List<Note>> getNotes();

  Future<void> saveNote(Note note);
}
