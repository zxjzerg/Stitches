import 'package:get_it/get_it.dart';
import 'package:localstore/localstore.dart';

class StitchesFramework {
  static void init() {
    initDi();
  }

  /// 初始化依赖
  static void initDi() {
    final getIt = GetIt.instance;

    getIt.registerSingleton<Localstore>(Localstore.instance);
  }
}
