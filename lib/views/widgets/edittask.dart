import 'package:flutter/material.dart';
import 'package:bottom/models/note.dart';  

class Edittask extends StatefulWidget {
  final Note note;

  Edittask({super.key, required this.note});

  @override
  _EdittaskState createState() => _EdittaskState();
}

class _EdittaskState extends State<Edittask> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController taskController;
  late TextEditingController dateController;

  @override
  void initState() {
    super.initState();
    taskController = TextEditingController(text: widget.note.title);
    dateController = TextEditingController(text: widget.note.date);
  }

  @override
  void dispose() {
    taskController.dispose();
    dateController.dispose();
    super.dispose();
  }

  void saveFunction(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.pop(context, {
        'title': taskController.text,
        'date': dateController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Change your note"),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel ❌"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () => saveFunction(context),
          child: const Text("Done ✅"),
        ),
      ],
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: taskController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: 'Enter your note title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: dateController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a date';
                }
                return null;
              },
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: 'Date',
                hintText: 'Enter the date',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
