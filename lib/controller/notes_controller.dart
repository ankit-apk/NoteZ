import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class NotesController extends GetxController {
  var notesList = List.empty(growable: true).obs;
  var trashNoteList = List.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    getNotes();
    trashNotes();
  }

  addNotes() {
    Map<String, dynamic> demoData = {
      "Title": Get.arguments[0].toString(),
      "Note": Get.arguments[1].toString(),
    };
    CollectionReference c = FirebaseFirestore.instance.collection("Notes");
    c.doc(Get.arguments[0].toString()).set(demoData);
  }

  getNotes() {
    CollectionReference c = FirebaseFirestore.instance.collection("Notes");
    c.snapshots().listen(
      (snapshot) {
        notesList.addAll(snapshot.docs);
      },
    );
  }

  deleteNote() {
    CollectionReference c = FirebaseFirestore.instance.collection("Notes");
    c.doc(Get.arguments[0].toString()).delete();
  }

  deleteTrashNote() {
    CollectionReference c = FirebaseFirestore.instance.collection("Trash");
    c.doc(Get.arguments[0].toString()).delete();
  }

  movetoTrash() {
    Map<String, dynamic> demoData = {
      "Title": Get.arguments[0].toString(),
      "Note": Get.arguments[1].toString(),
    };
    CollectionReference c = FirebaseFirestore.instance.collection("Trash");
    c.doc(Get.arguments[0].toString()).set(demoData);
  }

  trashNotes() {
    CollectionReference c = FirebaseFirestore.instance.collection("Trash");
    c.snapshots().listen(
      (snapshot) {
        trashNoteList.addAll(snapshot.docs);
      },
    );
  }
}
