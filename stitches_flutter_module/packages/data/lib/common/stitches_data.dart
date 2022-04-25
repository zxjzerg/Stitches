import 'package:data/repository/note/note_data_repository.dart';
import 'package:data/repository/note/note_local_data_source.dart';
import 'package:data/repository/note/note_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:localstore/localstore.dart';

class StitchesData {
  static initDi() {
    final getIt = GetIt.instance;

    getIt.registerSingleton<Localstore>(Localstore.instance);
    getIt.registerSingleton<NoteLocalDataSource>(NoteLocalDataSource());
    getIt.registerSingleton<NoteRepository>(NoteDataRepository());
  }
}
