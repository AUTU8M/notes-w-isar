import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp_isar/components/drawer.dart';
import 'package:notesapp_isar/components/text_tile.dart';
import 'package:notesapp_isar/models/note.dart';
import 'package:notesapp_isar/models/note_database.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  //text controller
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    //on app startup fetch the existing notes
    readNotes();
  }

  //create a note
  void createNote() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: TextField(controller: textController),
            actions: [
              //create button
              MaterialButton(
                onPressed: () {
                  context.read<NoteDatabase>().addNote(textController.text);

                  //clear controller
                  textController.clear();

                  Navigator.pop(context);
                },
                child: const Text("create"),
              ),
            ],
          ),
    );
  }

  //read notes
  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  //update a note
  void updateNote(Note note) {
    //pre-fill the current note text
    textController.text = note.text;
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("update note"),
            content: TextField(controller: textController),
            actions: [
              MaterialButton(
                onPressed: () {
                  //update note in db
                  context.read<NoteDatabase>().updateNote(
                    note.id,
                    textController.text,
                  );
                  //clear controller
                  textController.clear();
                  //pop dialog box
                  Navigator.pop(context);
                },
                child: Text("update"),
              ),
            ],
          ),
    );
  }

  //delete a note
  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    //note database
    final noteDatabase = context.watch<NoteDatabase>();

    //current notes
    List<Note> currentNotes = noteDatabase.currentNotes;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,

      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: Icon(Icons.add),
      ),
      drawer: const MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Heading
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Notes",
              style: GoogleFonts.dmSerifText(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: currentNotes.length,
              itemBuilder: (context, index) {
                final note = currentNotes[index];

                //list tile ui
                return TextTile(text: note.text);
              },
            ),
          ),
        ],
      ),
    );
  }
}
