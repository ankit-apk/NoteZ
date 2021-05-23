import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:notesz/view/addNote.dart';
import 'package:notesz/view/allNote.dart';
import 'package:notesz/view/trashNote.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  final pages = [AllNote(), AddNote(), TrashNote()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff3B4254),
        // bottomNavigationBar: ConvexAppBar(
        //   backgroundColor: Color(0xff3A4153),
        //   items: [
        //     TabItem(icon: Icons.list, title: 'Notes'),
        //     TabItem(icon: Icons.add, title: 'Add'),
        //     TabItem(icon: Icons.delete, title: 'Trash')
        //   ],
        //   onTap: (i) {
        //     setState(() {
        //       currentPage = i;
        //     });
        //   },
        // ),
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddNote();
              }));
            }),
        bottomNavigationBar: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TrashNote();
                  }));
                },
                child: Icon(
                  Icons.delete,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: AllNote());
  }
}
