import 'package:core/entity/note.dart';

/// 记事本的数据操作方法的接口
abstract class NoteRepository {
  /// 获取所有的记事
  Future<List<Note>> getNotes();

  /// 保存/创建笔记
  Future<void> saveNote(Note note);

  /// 删除所有笔记
  Future<void> deleteAll();
}
