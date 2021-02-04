import 'package:flutter/material.dart';
import 'package:myplanner/Models/NoteData.dart';
import 'package:myplanner/Widgets/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class NoteProvider with ChangeNotifier {
  List<Widget> notesDisplayed;
  List<Note> notesDatabase;
  Widget singleNoteData;
  Future<List<Widget>> widgetGenerator(notesDatabase) async {
    for (var i = 0; i > notesDatabase.length; i++) {
      singleNoteData = NoteWidget(
        noteDescription: notesDatabase[i]['noteDescription'],
        noteTitle: notesDatabase[i]['noteTitle'],
        noteDate: notesDatabase[i]['noteDate'],
      );
      notesDisplayed.add(singleNoteData);
    }
  }

  Future<Database> accessDatabase() async {
    final Database database = await openDatabase(
      // Set the path to the database.
      join(await getDatabasesPath(), 'notesDatabase.db'),

// When the database is first created, create a table to store notes.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          "CREATE TABLE notes(noteId INTEGER PRIMARY KEY, noteTitle TEXT, noteDescription TEXT,noteDate TEXT)",
        );
      },
      // Set the version. This executes the onCreate function and provides a path to perform database upgrades and downgrades.
      version: 1,
    );
    return database;
  }

  Future<void> insertNote(Note note) async {
    // Get a reference to the database.
    final Database db = await accessDatabase();
    // Insert the noteData into the correct table.

    await db.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future retrieveNotes() async {
    // Get a reference to the database.
    final Database db = await accessDatabase();

    // Query the table for all The Notes.
    final List<Map<String, dynamic>> maps = await db.query('notes');

    // Convert the List<Map<String, dynamic> into a List<Dog>.

    notesDatabase = List.generate(
      maps.length,
      (i) {
        return Note(
          noteId: maps[i]['noteId'],
          noteTitle: maps[i]['noteTitle'],
          noteDate: maps[i]['noteDate'],
          noteDescription: maps[i]['noteDescription'],
        );
      },
    );

    return notesDatabase;
  }
}
