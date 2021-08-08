import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_appcheck/checkout3.dart';
import 'package:flutter_appcheck/checkoutpage.dart';
import 'package:flutter_appcheck/database.dart';
import 'package:http/http.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class checkout2 extends StatefulWidget {
  // const chechout1({Key? key}) : super(key: key);

  @override
  _checkout2State createState() => _checkout2State();
}


class _checkout2State extends State<checkout2> {

  String Street1;
  String Street2;
  String City;
  String State;
  String Country;

  final CollectionReference newcollection = Firestore.instance.collection('userdata');
  String uid;

  Future<void> checkout1() async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    await Database(uid: user.uid).updateuserdata(Street1, Street2, City, State, Country);

  }

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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Check()));
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
                      Firestore.instance.collection("userdata").add({
                        'Street1': Street1,
                        'Street2': Street2,
                        'City': City,
                        'State': State,
                        'Country': Country,

                      });
                    });
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

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(height: 20,),

              Image(image: AssetImage("images/Capture2.PNG"),
                width: 350,
                //height: 100,
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
                    Text("Billing address is the same as delivery address",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20,),

              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Text("Street 1",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10,),

              Container(
                //height: 40,
                //color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Street 1",
                      hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),

                    onChanged: (input) {
                      Street1 = input;
                    },
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Text("Street 2",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10,),

              Container(
                //height: 40,
                //color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (input) {
                      Street2 = input;
                    },

                    decoration: InputDecoration(
                      hintText: "Street 2",
                      hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Text("City",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10,),

              Container(
                //height: 40,
                //color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (input) {
                      City = input;
                    },

                    decoration: InputDecoration(
                      hintText: "City",
                      hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Text("State",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                //height: 40,
                //color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    onChanged: (input) {
                      State = input;
                    },

                    decoration: InputDecoration(
                      hintText: "State",
                      hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),

              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text("Country",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              Container(
                //height: 40,
                //color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                    onChanged: (input) {
                      Country = input;
                    },

                    decoration: InputDecoration(
                      hintText: "Country",
                      hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 15),
                    //   child: FlatButton(
                    //     color: Colors.white,
                    //     onPressed: () {
                    //       Navigator.push(context, MaterialPageRoute(builder: (context) => checkout1(),
                    //       )
                    //       );
                    //     },
                    //
                    //     child: Text("BACK",
                    //       style: TextStyle(
                    //         color: Colors.orange,
                    //         fontSize: 20,
                    //       ),
                    //     ),
                    //
                    //   ),
                    // ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}