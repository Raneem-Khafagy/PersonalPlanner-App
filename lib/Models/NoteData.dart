import 'package:flutter/cupertino.dart';

class NoteData {
  final String title;
  final String description;
  final noteId;

  NoteData({
    @required this.title,
    @required this.description,
    this.noteId,
  });
}
