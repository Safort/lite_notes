import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/notes.dart';


class NotePage extends StatelessWidget {
  // final Note note;
  final int noteIndex;

  NotePage(this.noteIndex);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesModel>(
      builder: (context, model, s) {
        final note = model.notes[noteIndex];

        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Expanded(
                  child: Text(note.title),
                ),
                new RaisedButton(
                  color: Colors.greenAccent,
                  onPressed: null,
                  child: Text(
                    'Edit',
                    // textAlign: TextAlign.left,
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
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    note.title,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    note.description,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            )
          ),

        );
      }
    );
  }
}