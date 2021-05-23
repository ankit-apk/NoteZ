import 'package:flutter/material.dart';
import 'package:notesz/bLoc/notes_bloc.dart';
import 'package:notesz/view/home.dart';

class TrashNote extends StatefulWidget {
  @override
  _TrashNoteState createState() => _TrashNoteState();
}

class _TrashNoteState extends State<TrashNote> {
  var notesBloc = NotesBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        bottomNavigationBar: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Home();
                  }));
                },
                child: Icon(
                  Icons.list,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xff3B4254),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                  future: notesBloc.trashNotes(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      reverse: true,
                      shrinkWrap: true,
                      itemCount: notesBloc.trashnotesList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            notesBloc.addNotes(
                                notesBloc.trashnotesList[index]['Title'],
                                notesBloc.trashnotesList[index]['Video'],
                                notesBloc.trashnotesList[index]['Note']);
                            notesBloc.deleteTrashNote(
                                notesBloc.trashnotesList[index]['Title']);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
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
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          notesBloc.trashnotesList[index]
                                                  ['Title']
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white60,
                                              fontSize: 25)),
                                      Icon(
                                        Icons.restore,
                                        size: 35,
                                        color: Colors.white,
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
