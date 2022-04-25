import 'package:data/model/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/pages/edit_note/bloc/edit_note_bloc.dart';

/// 创建/编辑笔记界面
class EditNotePage extends StatelessWidget {
  const EditNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditNoteBloc? bloc;
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
                      content: "测试内容",
                      title: "测试标题",
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
          },
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 4, left: 12, right: 12),
                child: TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "标题",
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 24, left: 12, right: 12),
                  child: TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: '内容',
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    minLines: 5,
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
