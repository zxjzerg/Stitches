import 'package:core/entity/note.dart';
import 'package:localstore/localstore.dart';

/// 笔记的本地数据源，使用了[LocalStore](https://pub.dev/packages/localstore)库来存储数据。
class NoteLocalDataSource {
  /// 数据库
  late Localstore _db;

  NoteLocalDataSource() {
    _db = Localstore.instance;
  }

  Future<List<Note>> getNotes() async {
    final List<Note> notes = [];
    final rawNotes = await _db.collection('notes').get();
    rawNotes?.entries.forEach((element) {
      notes.add(Note(
        id: element.value['id'],
        title: element.value['title'],
        content: element.value['content'],
      ));
    });
    return notes;
  }

  Future<void> saveNote(Note note) async {
    // 检查是否一个新的笔记，新笔记则创建一个新的id
    String id;
    if (note.id == null) {
      id = _db.collection('notes').doc().id;
    } else {
      id = note.id!;
    }

    await _db.collection('notes').doc(id).set({
      'id': id,
      'title': note.title,
      'content': note.content,
    });
  }

  Future<void> deleteAllNotes() async {
    final rawNotes = await _db.collection('notes').get();
    rawNotes?.entries.forEach((element) async {
      await _db.collection('notes').doc(element.value['id']).delete();
    });
  }
}
