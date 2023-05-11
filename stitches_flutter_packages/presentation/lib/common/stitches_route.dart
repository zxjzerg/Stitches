import 'package:flutter/material.dart';
import 'package:presentation/pages/edit_note/edit_note_page.dart';
import 'package:presentation/pages/note_list/note_list_page.dart';

/// 路由管理类
class StitchesRoute {
  static Map<String, WidgetBuilder> routes = {
    editNotePage: (context) => const EditNotePage(),
    noteListPage: (context) => const NoteListPage(),
  };

  static const String editNotePage = '/note/edit';
  static const String noteListPage = '/note/list';
}
