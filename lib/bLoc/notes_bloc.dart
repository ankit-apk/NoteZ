import 'package:cloud_firestore/cloud_firestore.dart';

enum AppActions { AddNote, DeleteNote, RestoreNote }

class NotesBloc {
  var notesList = List.empty(growable: true);
  var trashnotesList = List.empty(growable: true);

  addNotes(String title, String video, String note) async {
    Map<String, dynamic> demoData = {
      "Title": title.toString(),
      "Video": video.toString(),
      "Note": note.toString(),
    };
    CollectionReference c = FirebaseFirestore.instance.collection("Notes");
    c.doc(title.toString()).set(demoData);
  }

  getNotes() async {
    CollectionReference c = FirebaseFirestore.instance.collection("Notes");
    c.snapshots().listen(
      (snapshot) {
        notesList.addAll(snapshot.docs);
        return snapshot.docs.toList();
      },
    );
  }

  deleteNote(String title) async {
    CollectionReference c = FirebaseFirestore.instance.collection("Notes");
    c.doc(title.toString()).delete();
  }

  movetoTrash(String title, String video, String notes) async {
    Map<String, dynamic> demoData = {
      "Title": title.toString(),
      "Video": video.toString(),
      "Note": notes.toString(),
    };
    CollectionReference c = FirebaseFirestore.instance.collection("Trash");
    c.doc(title.toString()).set(demoData);
  }

  trashNotes() async {
    CollectionReference c = FirebaseFirestore.instance.collection("Trash");
    c.snapshots().listen(
      (snapshot) {
        trashnotesList.addAll(snapshot.docs);
      },
    );
  }

  deleteTrashNote(String title) async {
    CollectionReference c = FirebaseFirestore.instance.collection("Trash");
    c.doc(title.toString()).delete();
  }
}
