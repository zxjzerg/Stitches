import 'package:data/model/note.dart';
import 'package:data/repository/note/note_local_data_source.dart';
import 'package:data/repository/note/note_repository.dart';
import 'package:get_it/get_it.dart';

/// 笔记数据接口类的实现
///
/// 实现了如何笔记如何保存到数据仓库的逻辑
class NoteDataRepository extends NoteRepository {
  final localDataSource = GetIt.I.get<NoteLocalDataSource>();

  @override
  Future<List<Note>> getNotes() {
    return localDataSource.getNotes();
  }

  @override
  Future<void> saveNote(Note note) {
    return localDataSource.saveNote(note);
  }

  @override
  Future<void> deleteAll() {
    return localDataSource.deleteAllNotes();
  }
}
