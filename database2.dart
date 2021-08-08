import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class database {
  String uid;
  database({this.uid});
  final CollectionReference user = Firestore.instance.collection('user');
  Future updateuserdata( String Name, String Card, String Expiry, String CVV) async {
    return await user.document(uid).setData({
      "Name": Name,
      "Card": Card,
      "Expiry": Expiry,
      "CVV": CVV,
    });
  }
}