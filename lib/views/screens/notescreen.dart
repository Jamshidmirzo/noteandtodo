import 'package:bottom/controllers/notescontroller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notescreen extends StatefulWidget {
  const Notescreen({super.key});

  @override
  State<Notescreen> createState() => _NotescreenState();
}

class _NotescreenState extends State<Notescreen> {
  final notecontroller = Notescontroller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(side: BorderSide()),
        backgroundColor: Colors.red,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
              )),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_horiz_outlined))
        ],
        title: Text(
          'Oper\'s Notes APP',
          style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 23),
        ),
      ),
      body: FutureBuilder(
          future: notecontroller.getTask(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('Notelar yoq,note yozing'),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final note = snapshot.data![index];
                return ListTile(
                  title: Text(note.title),
                  subtitle: Text(note.date),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
    );
  }
}
