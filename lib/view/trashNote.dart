import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesz/controller/notes_controller.dart';
import 'package:notesz/view/viewTrashNote.dart';

class TrashNote extends StatefulWidget {
  @override
  _TrashNoteState createState() => _TrashNoteState();
}

class _TrashNoteState extends State<TrashNote> {
  NotesController n = Get.put(NotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Scaffold(
          backgroundColor: Color(0xff3B4254),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    reverse: true,
                    shrinkWrap: true,
                    itemCount: n.trashNoteList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            () => TrashNoteDetail(),
                            arguments: [
                              n.trashNoteList[index]['Note'].toString(),
                              n.trashNoteList[index]['Title'].toString()
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
                                  n.trashNoteList[index]['Title'].toString(),
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
    );
  }
}
