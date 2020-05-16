import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lite_notes/models/notes.dart';
import 'package:lite_notes/utils/types.dart';

class NewNotePage extends StatelessWidget {
  final note = Note('', '');

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesModel>(
      builder: (context, model, s) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Expanded(
                  child: Text('New Note'),
                ),
                new RaisedButton(
                  color: Colors.greenAccent,
                  onPressed: () async {
                    await model.addNote(note.title, note.description);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Save',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color.fromRGBO(200, 200, 200, 1),
                    ),
                  ),
                ),
              ]
            ),
          ),

          body: Center(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String text) {
                      note.title = text;
                    },
                  )
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    maxLines: 20,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String text) {
                      note.description = text;
                    },
                  )
                ),
              ],
            )
          ),

        );
      }
    );
  }
}