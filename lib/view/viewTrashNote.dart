import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesz/controller/notes_controller.dart';
import 'package:notesz/view/home.dart';

class TrashNoteDetail extends StatefulWidget {
  @override
  _TrashNoteDetailState createState() => _TrashNoteDetailState();
}

class _TrashNoteDetailState extends State<TrashNoteDetail> {
  NotesController n = Get.put(NotesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3B4254),
      body: SafeArea(
        child: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      height: 350,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(64, 75, 96, .9),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          Get.arguments[0],
                          style: TextStyle(fontSize: 20, color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(120, 30)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    onPressed: () {
                      Get.off(() => Home(),
                          arguments: [Get.arguments[1], Get.arguments[0]]);
                      n.deleteTrashNote();
                      n.notesList.clear();
                      n.trashNoteList.clear();
                    },
                    child: Icon(Icons.delete_forever),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
