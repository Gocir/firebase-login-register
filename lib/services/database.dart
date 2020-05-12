import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {

  //collection references
  final CollectionReference lingkungCollection = Firestore.instance.collection('lingkung');
}