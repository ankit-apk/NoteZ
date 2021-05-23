import 'package:flutter/material.dart';
import 'package:notesz/controller/notes_bloc.dart';
import 'package:notesz/view/detailNote.dart';

class AllNote extends StatefulWidget {
  @override
  _AllNoteState createState() => _AllNoteState();
}

class _AllNoteState extends State<AllNote> {
  var notesBloc = NotesBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff3B4254),
          body: SafeArea(
            child: Container(
              child: Column(
                children: [
                  FutureBuilder<Object>(
                      future: notesBloc.getNotes(),
                      builder: (context, snapshot) {
                        return ListView.builder(
                          reverse: true,
                          shrinkWrap: true,
                          itemCount: notesBloc.notesList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return NoteDetail(
                                        title: notesBloc.notesList[index]
                                                ['Title']
                                            .toString(),
                                        video: notesBloc.notesList[index]
                                                ['Video']
                                            .toString(),
                                        note: notesBloc.notesList[index]['Note']
                                            .toString(),
                                      );
                                    },
                                  ),
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
                                        notesBloc.notesList[index]['Title']
                                            .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white60,
                                            fontSize: 25)),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
