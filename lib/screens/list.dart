import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lite_notes/utils/types.dart';
import 'package:lite_notes/screens/note.dart';
import 'package:lite_notes/screens/newNote.dart';
import 'package:lite_notes/models/notes.dart';

class ListPage extends StatelessWidget {
  getList(List<Note> notes) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        final subtitle = note.description.substring(
          0,
          math.min(10, note.description.length)
        );

        return ListTile(
          title: Text(note.title),
          subtitle: Text(subtitle),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => onTap(context, index, note),
        );
      },
    );
  }

  getEmptyContent() {
    return Center(
      child: Text('Your list is empty'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesModel>(
      builder: (context, model, s) {
        final notes = model.notes;

        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('Notes')
            )
          ),
          body: Center(
            child: notes.length > 0 ? getList(notes) : getEmptyContent(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewNotePage())
              );
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      }
    );
  }

  onTap(BuildContext context, num index, Note note) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NotePage(index)));
  }
}
