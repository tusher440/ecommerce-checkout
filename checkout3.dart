import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_appcheck/checkout2.dart';
import 'package:flutter_appcheck/checkout3.dart';
import 'package:flutter_appcheck/checkoutpage.dart';
import 'package:flutter_appcheck/database.dart';
import 'package:flutter_appcheck/database2.dart';
import 'package:flutter_appcheck/endpage.dart';
import 'package:http/http.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class checkout3 extends StatefulWidget {
  //const checked({Key? key}) : super(key: key)

  String Name;
  String Card;
  String Expiry;
  String CVV;


  final CollectionReference newcollection = Firestore.instance.collection('user');
  String uid;

  Future<void> checkout2() async{

    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    await database(uid: user.uid).updateuserdata(Name, Card, Expiry, CVV,);

  }


  @override
  _checkout3State createState() => _checkout3State();
}

class _checkout3State extends State<checkout3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back_ios_outlined,
          color: Colors.black,
        ),
        title: Center(
          child: Text("Checkout",
            style: TextStyle(
              color: Colors.orange,
            ),
          ),
        ),
      ),

      bottomNavigationBar: Container(
        color: Colors.white,
        height: 100,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.orange)
              ),
              child: FlatButton(
                  height: 50,
                  splashColor: Colors.orange,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> checkout2()));
                    });
                  },
                  child: Text("Back",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange
                    ),
                  )
              ),
            ),

            SizedBox(width: 100,),

            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.orange),
                  color: Colors.orange
              ),
              child: FlatButton(
                  height: 50,
                  splashColor: Colors.white,
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  onPressed: (){
                    setState(() {
                      Firestore.instance.collection("user").add({
                        'Name': "Name",
                        'Card': "Card",
                        'Expiry': "Expiry",
                        'CVV': "CVV",

                      });
                      }
                    );
                  },
                  child: Text("Next",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),
                  )
              ),
            ),

          ],
        ),

      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(height: 20,),


            Image(image: AssetImage("images/Capture3.PNG"),
              width: 350,
              //height: 100,
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    SizedBox(height: 20,),
                    Container(
                      child: Text("Name on Card",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      //height: 40,

                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),

                          onChanged: (input) {
                            input = "Name";
                          }
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      child: Text("Card Number",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      //height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Card Number",
                          hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          icon: Icon(FontAwesomeIcons.ccMastercard),
                        ),

                          onChanged: (input) {
                             input = "Card";
                          }
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      child: Text("Expiry Date",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      //height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "dd/yy",
                          hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                          onChanged: (input) {
                            input = "Expiry";
                          }
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text("CVV",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      //height: 40,

                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "CVV",
                            hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),

                            onChanged: (input) {
                                input = "CVV";
                            }
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20,),
            Container(
              child: Row(
                children: [

                  IconButton(
                    onPressed: () {

                    },
                    icon: Icon(Icons.check_circle,
                      color: Colors.green,
                    ),
                  ),
                  Text("Save this card details",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
