import 'package:core/entity/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:presentation/pages/edit_note/bloc/edit_note_bloc.dart';

/// 创建/编辑笔记界面
class EditNotePage extends HookWidget {
  const EditNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleTextController = useTextEditingController();
    final contentTextController = useTextEditingController();
    final Note? note = ModalRoute.of(context)!.settings.arguments as Note?;
    if (note?.title?.isNotEmpty == true) {
      titleTextController.text = note!.title!;
    }
    if (note?.content?.isNotEmpty == true) {
      contentTextController.text = note!.content!;
    }
    return BlocProvider<EditNoteBloc>(
      create: (context) => EditNoteBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("编辑笔记"),
            actions: [
              IconButton(
                icon: const Icon(Icons.done),
                onPressed: () {
                  BlocProvider.of<EditNoteBloc>(context).add(
                    EditNoteEvent(
                      Note(
                        id: note?.id,
                        content: titleTextController.text,
                        title: contentTextController.text,
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
                    controller: titleTextController,
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
                      controller: contentTextController,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
