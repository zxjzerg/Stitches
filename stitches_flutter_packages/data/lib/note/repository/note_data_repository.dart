import 'package:core/entity/note.dart';
import 'package:framework/data/note_local_data_source.dart';

import 'note_repository.dart';

/// 笔记数据接口类的实现
///
/// 实现了如何笔记如何保存到数据仓库的逻辑
class NoteDataRepository extends NoteRepository {
  late NoteLocalDataSource _localDataSource;

  NoteDataRepository() {
    _localDataSource = NoteLocalDataSource();
  }

  @override
  Future<List<Note>> getNotes() {
    return _localDataSource.getNotes();
  }

  @override
  Future<void> saveNote(Note note) {
    return _localDataSource.saveNote(note);
  }

  @override
  Future<void> deleteAll() {
    return _localDataSource.deleteAllNotes();
  }
}
