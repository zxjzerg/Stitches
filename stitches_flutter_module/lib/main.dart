import 'package:data/common/stitches_data.dart';
import 'package:flutter/material.dart';
import 'package:presentation/common/stitches_route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initDi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: StitchesRoute.noteListPage,
      routes: StitchesRoute.routes,
    );
  }
}

/// 初始化依赖注入
initDi() {
  StitchesData.initDi();
}
