import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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

void NoteDatabase() async {
// Open the database and store the reference.
//creat database and a table of the data
  final Future<Database> database = openDatabase(
    // Set the path to the database.
    join(await getDatabasesPath(), 'notesDatabase.db'),

// When the database is first created, create a table to store notes.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        "CREATE TABLE notes(noteDate INTEGER PRIMARY KEY, noteTitle TEXT, noteDescription TEXT,noteDate TEXT)",
      );
    },
    // Set the version. This executes the onCreate function and provides a path to perform database upgrades and downgrades.
    version: 1,
  );

// function that inserts NOTES into the database
  Future<void> insertNote(Note note) async {
    // Get a reference to the database.
    final Database db = await database;
    // Insert the noteData into the correct table.
    await db.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

// A method that retrieves all the NoteData from the dogs table.
  Future<List<Note>> retrieveNotes() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Notes.
    final List<Map<String, dynamic>> maps = await db.query('notes');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Note(
        noteId: maps[i]['noteId'],
        noteTitle: maps[i]['noteTitle'],
        noteDate: maps[i]['noteDate'],
        noteDescription: maps[i]['noteDescription'],
      );
    });
  }

//update that information at a later time. //editing
  Future<void> updateNote(Note note) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given note.
    await db.update(
      'notes',
      note.toMap(),
      // Ensure that the note has a matching id.
      where: "noteId = ?",
      // Pass the notes's id as a whereArg to prevent SQL injection.
      whereArgs: [note.noteId],
    );
  }

  Future<void> deleteNote(int noteId) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'notes',
      // Use a `where` clause to delete a specific note.
      where: "noteId = ?",
      // Pass the note's id as a whereArg to prevent SQL injection.
      whereArgs: [noteId],
    );
  }
}
