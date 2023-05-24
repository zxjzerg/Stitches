import 'package:core/entity/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/common/stitches_route.dart';
import 'package:presentation/pages/note_list/bloc/note_list_bloc.dart';

/// 笔记列表界面
class NoteListPage extends StatelessWidget {
  const NoteListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NoteListBloc>(
      create: (context) => NoteListBloc()..add(LoadNoteListEvent()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("笔记列表"),
            actions: [
              // 删除所有笔记
              IconButton(
                icon: const Icon(Icons.delete),
                tooltip: 'delete all notes',
                onPressed: () => BlocProvider.of<NoteListBloc>(context)
                    .add(DeleteAllNotesEvent()),
              ),
            ],
          ),
          body: BlocBuilder<NoteListBloc, NoteListState>(
            builder: (context, state) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Note note = state.notes[index];
                  return ListTile(
                    title: Text("${note.title}"),
                    subtitle: Text("${note.content}"),
                    onTap: () => Navigator.pushNamed(
                      context,
                      StitchesRoute.editNotePage,
                      arguments: note,
                    ),
                  );
                },
                itemCount: state.notes.length,
              );
            },
          ),
          // 创建笔记
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, StitchesRoute.editNotePage).then(
                (value) {
                  // 检查返回值，如果返回值是改动了笔记，则需要刷新笔记列表
                  if (value != null) {
                    if (value as bool)
                      BlocProvider.of<NoteListBloc>(context)
                          .add(LoadNoteListEvent());
                  }
                },
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      }),
    );
  }
}
