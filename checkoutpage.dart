import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_appcheck/checkout2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Check extends StatefulWidget {
  //const Check({Key? key}) : super(key: key);

  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
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
        height: 50,

        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 280),
            child: FlatButton(
                height: 30,

                splashColor: Colors.red,
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                onPressed: (){
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> checkout2()));
                  });
                },
                child: SingleChildScrollView(
                  child: Text("Next",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                )
            ),
          ),
        ),

      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Image(image: AssetImage("images/Capture.PNG"),
                width: 350,
                //height: 100,
              ),

              SizedBox(height: 20,),

              Container(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Standard Delivery",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text("Order will be delivered between 3-5 business days",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),

                        ),
                      ],
                    ),

                    SizedBox(width: 20,),

                    Icon(Icons.circle,
                      color: Colors.white,
                    ),

                  ],
                ),
              ),

              SizedBox(height: 50,),

              Container(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Next Day Delivery",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          width: MediaQuery.of(context).size.width/1.3,
                          child: Text("Place your order before 6pm and your items will be delivered the next day",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),

                          ),
                        ),
                      ],
                    ),

                    SizedBox(width: 20,),

                    Icon(Icons.circle,
                      color: Colors.white,
                    ),

                  ],
                ),
              ),

              SizedBox(height: 50,),

              Container(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Nominated Delivery",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20
                          ),
                        ),

                        SizedBox(height: 10,),
                        Container(
                          width: MediaQuery.of(context).size.width/1.3,
                          child: Text("Pick a particular date from the calendar and order will be delivered on selected date",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),

                          ),

                        ),
                      ],
                    ),

                    Icon(Icons.circle,
                      color: Colors.white,
                    ),

                    //SizedBox(width: 20,)

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
