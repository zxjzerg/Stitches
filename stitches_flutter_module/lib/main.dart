import 'package:data/common/stitches_data.dart';
import 'package:flutter/material.dart';
import 'package:presentation/pages/edit_note/edit_note_page.dart';

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
      home: const EditNotePage(),
    );
  }
}

/// 初始化依赖注入
initDi() {
  StitchesData.initDi();
}
