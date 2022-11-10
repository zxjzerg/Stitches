import 'package:core/entity/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/pages/edit_note/bloc/edit_note_bloc.dart';

/// 创建/编辑笔记界面
class EditNotePage extends StatefulWidget {
  const EditNotePage({Key? key}) : super(key: key);

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  final _titleTextController = TextEditingController();
  final _contentTextController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleTextController.dispose();
    _contentTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    EditNoteBloc? bloc;
    final Note? note = ModalRoute.of(context)!.settings.arguments as Note?;
    if (note?.title?.isNotEmpty == true) {
      _titleTextController.text = note!.title!;
    }
    if (note?.content?.isNotEmpty == true) {
      _contentTextController.text = note!.content!;
    }
    return BlocProvider<EditNoteBloc>(
      create: (context) {
        bloc = EditNoteBloc();
        return bloc!;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("编辑笔记"),
          actions: [
            IconButton(
              icon: const Icon(Icons.done),
              onPressed: () {
                bloc?.add(
                  EditNoteEvent(
                    Note(
                      id: note?.id,
                      content: _contentTextController.text,
                      title: _titleTextController.text,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: BlocListener<EditNoteBloc, EditNoteState>(
          listener: (context, state) {
            debugPrint(state.toString());
            if (state is EditNoteSuccess) {
              Navigator.pop(context, true);
            }
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "标题",
                    contentPadding: EdgeInsets.all(12),
                  ),
                  controller: _titleTextController,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    left: 16,
                    right: 16,
                    bottom: 12,
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '内容',
                      contentPadding: EdgeInsets.all(12),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    minLines: 100,
                    controller: _contentTextController,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
