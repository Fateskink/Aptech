import 'package:flutter/material.dart';
import 'package:noteapp/models/note.dart';
import 'package:noteapp/repositories/note_repository.dart';
import 'package:noteapp/screens/list_item.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final noteRepository = Provider.of<NoteRepository>(context);
    List<Note> notes = noteRepository.getNotes();
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 80,
                color: Colors.red,
              ),
              Expanded(child: ListView.builder(
                  itemCount: noteRepository.getNotes().length,
                  itemBuilder: (context,index) {
                    return ListItem(index: index, note: notes[index],);
              }))
            ],
          ),
        ),
      ),
    );
  }
}
