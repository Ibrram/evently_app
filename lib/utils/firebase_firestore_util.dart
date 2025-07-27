import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_task_app/models/event_model.dart';
import 'package:flutter/material.dart';

abstract class FirebaseFirestoreUtil {
  static CollectionReference<EventModel> _getCollectionReference() {
    return FirebaseFirestore.instance
        .collection(EventModel.collection)
        .withConverter(
          fromFirestore: (snapshot, _) =>
              EventModel.fromFirestore(snapshot.data()!),
          toFirestore: (value, _) => value.toFirestore(),
        );
  }

  static void createEvent(EventModel event, context) async {
    var reference = _getCollectionReference();
    try {
      await reference.doc().set(event);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Event added Successfully')));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error Happenet: $e')));
    }
  }
}
