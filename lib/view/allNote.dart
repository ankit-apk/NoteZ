import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesz/controller/notes_controller.dart';
import 'package:notesz/view/detailNote.dart';

class AllNote extends StatefulWidget {
  @override
  _AllNoteState createState() => _AllNoteState();
}

class _AllNoteState extends State<AllNote> {
  NotesController n = Get.put(NotesController());

  // @override
  // void initState() {
  //   super.initState();
  //   n.getNotes();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Scaffold(
            backgroundColor: Color(0xff3B4254),
            body: SafeArea(
              child: Container(
                child: Column(
                  children: [
                    ListView.builder(
                      reverse: true,
                      shrinkWrap: true,
                      itemCount: n.notesList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              () => NoteDetail(),
                              arguments: [
                                n.notesList[index]['Note'].toString(),
                                n.notesList[index]['Title'].toString(),
                              ],
                            );
                          },
                          child: Card(
                            elevation: 8.0,
                            margin: new EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 6.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(64, 75, 96, .9)),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                    n.notesList[index]['Title'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white60,
                                        fontSize: 25)),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
