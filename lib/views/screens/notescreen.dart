import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bottom/controllers/notescontroller.dart';
import 'package:bottom/models/note.dart';
import 'package:bottom/views/widgets/addnotes.dart';
import 'package:bottom/views/widgets/edittask.dart';
import 'package:bottom/views/widgets/noteswidget.dart';

class Notescreen extends StatefulWidget {
  const Notescreen({super.key});

  @override
  State<Notescreen> createState() => _NotescreenState();
}

class _NotescreenState extends State<Notescreen> {
  @override
  void initState() {
    noteController.createDatabase();
    super.initState();
  }

  final Notescontroller noteController = Notescontroller();

  Future<void> editNote(Note note) async {
    final response = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        return Edittask(note: note);
      },
    );
    if (response != null &&
        response['title'] != null &&
        response['date'] != null) {
      await noteController.editTasksfromsql(
          note.id, response['title']!, response['date']!);
      setState(() {});
    }
  }

  Future<void> deleteNote(Note note) async {
    await noteController.deleteTaskfromsql(note.id);
    setState(() {});
  }

  Future<void> addTask() async {
    final response = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        return Addnotes();
      },
    );
    if (response != null &&
        response['title'] != null &&
        response['date'] != null) {
      await noteController.addTask(response['title']!, response['date']!);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(side: BorderSide()),
        backgroundColor: Colors.red,
        onPressed: addTask,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 30),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz_outlined),
          ),
        ],
        title: Text(
          'Oper\'s Notes APP',
          style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 23),
        ),
      ),
      body: FutureBuilder<List<Note>>(
        future: noteController.getTask(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No notes available, please add a note.'),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final note = snapshot.data![index];
              return Noteswidget(
                note: note,
                isDelete: () => deleteNote(note),
                isEdit: () => editNote(note),
              );
            },
          );
        },
      ),
    );
  }
}
