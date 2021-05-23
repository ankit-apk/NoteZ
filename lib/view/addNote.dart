import 'package:flutter/material.dart';
import 'package:notesz/controller/notes_bloc.dart';
import 'package:notesz/view/home.dart';

class AddNote extends StatefulWidget {
  String title = '';
  String video = '';
  String notes = '';

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  var notesBloc = NotesBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xff3B4254),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                      decoration: InputDecoration(
                        hintText: "  Title",
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                      onChanged: (input) {
                        setState(
                          () {
                            widget.title = input;
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                      decoration: InputDecoration(
                        hintText: "  Video url",
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                      onChanged: (input) {
                        setState(
                          () {
                            widget.video = input;
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                      decoration: InputDecoration(
                        hintText: "  Description",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                      onChanged: (newinput) {
                        setState(
                          () {
                            widget.notes = newinput;
                          },
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(120, 30)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    onPressed: () {
                      notesBloc.addNotes(
                          widget.title, widget.video, widget.notes);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Icon(Icons.add),
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
