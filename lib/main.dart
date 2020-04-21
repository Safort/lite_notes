import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lite_notes/models/notes.dart';
import 'package:lite_notes/screens/list.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => NotesModel(),
    child: Root(),
  )
);

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
      ),
      title: 'Title',
      home: ListPage(),
    );
  }
}
