import 'package:flutter/material.dart';

/// 创建/编辑笔记界面
class EditNotePage extends StatelessWidget {
  const EditNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("编辑笔记"),
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
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
          )
        ],
      ),
    );
  }
}
