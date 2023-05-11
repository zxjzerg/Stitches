import 'package:data/note/repository/note_data_repository.dart';
import 'package:data/note/repository/note_repository.dart';
import 'package:get_it/get_it.dart';

class StitchesData {
  static initDi() {
    final getIt = GetIt.instance;

    getIt.registerSingleton<NoteRepository>(NoteDataRepository());
  }
}
