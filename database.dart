import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Database {
  String uid;
  Database({this.uid});
  final CollectionReference user = Firestore.instance.collection('userdata');
  Future updateuserdata( String Street1, String Street2, String City, String State, String Country) async {
    return await user.document(uid).setData({
      "Street1": Street1,
      "Street2": Street2,
      "City": City,
      "State": State,
      "Country": Country,
    });
  }
}


