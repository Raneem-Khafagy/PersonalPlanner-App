import 'package:flutter/cupertino.dart';

import 'package:flutter/widgets.dart';

class Note {
  final String noteTitle;
  final noteDate;
  final String noteDescription;
  final int noteId;

  Note({
    @required this.noteTitle,
    @required this.noteDescription,
    @required this.noteDate,
    this.noteId,
  });

  // Convert a NoteData into a Map. The keys correspondS to the names of the columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'noteTitle': noteTitle,
      'noteDate': noteDate,
      'noteDescription': noteDescription,
      'noteId': noteId,
    };
  }
}
