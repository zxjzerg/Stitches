import 'package:data/model/note.dart';
import 'package:get_it/get_it.dart';
import 'package:localstore/localstore.dart';

class NoteLocalDataSource {
  final db = GetIt.I.get<Localstore>();

  Future<List<Note>> getNotes() async {
    final List<Note> notes = [];
    final rawNotes = await db.collection('notes').get();
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
      id = db.collection('notes').doc().id;
    } else {
      id = note.id!;
    }

    await db.collection('notes').doc(id).set({
      'title': note.title,
      'content': note.content,
    });
  }
}
