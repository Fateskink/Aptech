import 'package:flutter/material.dart';
import 'package:noteapp/models/note.dart';

class NoteRepository extends ChangeNotifier{
  List<Note> getNotes() {
    List<Note> notes = <Note>[];
    notes.add(Note(content: 'Di choi', isImportant: true));
    notes.add(Note(content: 'LKam bt javas', isImportant: false));
    notes.add(Note(content: 'Code C#', isImportant: true));
    notes.add(Note(content: 'Lam android', isImportant: false));
    notes.add(Note(content: 'Viet CV', isImportant: true));
    notes.add(Note(content: 'Di xin viec', isImportant: false));
    notes.add(Note(content: 'Tu hat mot minh', isImportant: true));
    notes.add(Note(content: 'Dancing', isImportant: true));
    notes.add(Note(content: 'Go out', isImportant: true));
    notes.add(Note(content: 'Len thu vien', isImportant: false));

    return notes;
  }
}