import 'package:flutter/material.dart';
import 'package:myplanner/Models/NoteData.dart';
import 'package:myplanner/Views/Widgets/NotesHomePage/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class PageProvider with ChangeNotifier {
  int pageNumber = 0;

  PageController pageController = PageController();

  void changePage(newPageNumber) {
    pageNumber = newPageNumber;
    notifyListeners();
  }
}

class NoteProvider with ChangeNotifier {
  List<Widget> noteCards = [];

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

  Future<void> updateNote(Note note) async {
    Database db = await accessDatabase();

    await db.update(
      'notes',
      note.toMap(),
      // Ensure that the Dog has a matching id.
      where: "noteId = ?",
      // Pass the note's id as a whereArg to prevent SQL injection.
      whereArgs: [note.noteId],
    );

    notifyListeners();
  }

  Future<void> deleteNote(int noteId) async {
    // Get a reference to the database.
    Database db = await accessDatabase();
    // Remove the Dog from the database.
    await db.delete(
      'notes',
      // Use a `where` clause to delete a specific note.
      where: "noteId = ?",
      // Pass the note's id as a whereArg to prevent SQL injection.
      whereArgs: [noteId],
    );
    notifyListeners();
  }

  Future<List<Note>> retrieveNotes() async {
    // Get a reference to the database.
    final Database db = await accessDatabase();
    // Query the table for all The Notes.
    final List<Map<String, dynamic>> maps = await db.query('notes');
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(
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
  }

  Future notesWidgetsList() async {
    print("retrieveNotes");
    noteCards.clear();
    List<Note> notesDatabase = await retrieveNotes();
    for (var i = 0; i > notesDatabase.length; i++) {
      print(i);
      noteCards.add(NoteWidget(
        noteId: notesDatabase[i].noteId,
        noteDescription: notesDatabase[i].noteDescription,
        noteTitle: notesDatabase[i].noteDate,
        noteDate: notesDatabase[i].noteDate,
      ));
    }
    print(noteCards);
    notifyListeners();
    return noteCards;
  }
}
