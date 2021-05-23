import 'package:flutter/material.dart';
import 'package:notesz/controller/notes_bloc.dart';
import 'package:notesz/view/home.dart';
import 'package:notesz/view/videoplayer.dart';

class NoteDetail extends StatefulWidget {
  String title;
  String video;
  String note;
  NoteDetail({this.note, this.video, this.title});
  @override
  _NoteDetailState createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  var notesBloc = NotesBloc();
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
                          widget.note,
                          style: TextStyle(fontSize: 20, color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      height: 100,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(64, 75, 96, .9),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return VideoDemo(video: widget.video.toString());
                            }));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.video,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white70),
                                ),
                              ),
                              Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 40,
                              )
                            ],
                          ),
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
                      notesBloc.movetoTrash(
                          widget.title, widget.video, widget.note);
                      notesBloc.deleteNote(widget.title);
                      Navigator.pop(context);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return Home();
                      }));
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
