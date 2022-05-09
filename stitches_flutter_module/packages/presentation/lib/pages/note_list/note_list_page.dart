import 'package:data/model/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/common/stitches_route.dart';
import 'package:presentation/pages/note_list/bloc/note_list_bloc.dart';

/// 笔记列表界面
class NoteListPage extends StatelessWidget {
  const NoteListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("笔记列表")),
      body: BlocProvider<NoteListBloc>(
        create: (context) => NoteListBloc()..add(LoadNoteListEvent()),
        child: BlocBuilder<NoteListBloc, NoteListState>(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, StitchesRoute.editNotePage);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
