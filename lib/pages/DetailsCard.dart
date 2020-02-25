import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:irondot_task/Models/FeaturesModel.dart';

class DetailsCard extends StatefulWidget {
  String name;
  String price;
  String address;
  String numBed;
  String numBath;
  String numParking;
  String descrption;
  List<Features> features = new List<Features>();
  String img1;
  String img2;
  String img3;

  DetailsCard(
      {this.name,
      this.price,
      this.address,
      this.numBed,
      this.numBath,
      this.numParking,
      this.descrption,
      this.features,
      this.img1,
      this.img2,
      this.img3});

  @override
  _DetailsCardState createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard>
     {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: <Widget>[


            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    height:350,
                    child: GridTile(
                      child: Container(

                        width: double.infinity,
                        child: Carousel(
                          showIndicator: false,
                          autoplay: false,
                          boxFit: BoxFit.fitWidth,
                          images: [
                            Image.network(widget.img1,fit: BoxFit.fitWidth),
                            Image.network(widget.img2,fit: BoxFit.fitWidth,),
                            Image.network(widget.img3,fit: BoxFit.fitWidth),
                          ],
                        ),
                      ),
                      footer: new Container(
                        color: Colors.white.withOpacity(0.1),
                        height: 100,
                        child: Row(
                          children: <Widget>[


                            Row(
                              children: <Widget>[

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(3)),
                                    Row(
                                      children: <Widget>[
                                        Padding(padding: EdgeInsets.only(left: 30)),
                                        Text(
                                          r"$ " + widget.price,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,

                                              color: Colors.white),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(right: 20)),
                                        Text(
                                          "Studio Apartment ",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),

                                      ],
                                    ),
                                    Padding(padding: EdgeInsets.all(3)),
                                   Padding(padding: EdgeInsets.only(left: 30),child:  Text(widget.address,style: TextStyle(color: Colors.white),),),



                                    Column(
                                      children: <Widget>[
                                        Padding(padding: EdgeInsets.fromLTRB(0,9,0,9),
                                          child: Container(width: MediaQuery.of(context).size.width ,
                                            height: 1,

                                            color: Colors.white.withOpacity(0.7),),),

                                        Row(
                                          children: <Widget>[

                                            Image.asset('images/assets/bath.png',color: Colors.white,height: 25,),
                                            Text("  "+widget.numBath + " Bath",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                            Padding(padding: EdgeInsets.only(left: 20)),
                                            Image.asset('images/assets/bed.png',color: Colors.white,height: 25),
                                            Text("  "+widget.numBed + " Bed",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                            Padding(padding: EdgeInsets.only(left: 20)),

                                            Image.asset('images/assets/car.png',color: Colors.white,height: 25),
                                            Text("  "+widget.numParking + " Parking",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),



                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 20, 3),
                        child: Text(
                          "Features",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 10, 5),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                   " Movie Theatre ",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black54),
                                ),
                                Padding(padding: EdgeInsets.only(right: 150)),
                                Text(widget.features[0].value)
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 10)),
                            Row(
                              children: <Widget>[
                                Text(
                                   " Shopping Mall",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black54),
                                ),
                                Padding(padding: (EdgeInsets.only(left: 150))),
                                Text(widget.features[1].value)
                              ],
                            ),

                            Padding(padding: EdgeInsets.only(bottom: 10)),

                            Row(
                              children: <Widget>[
                                Text(
                                 " Sports ",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black54),
                                ),
                                Padding(padding: (EdgeInsets.only(left: 200))),
                                Text(widget.features[2].value)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Description",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 3),
                    child: Text(
                      widget.descrption,
                      overflow: TextOverflow.clip,
                      maxLines: 13,
                      style: TextStyle(color: Colors.black54),
                    ),
                  )
                ],
              )
        ],
      ),
    );
  }


}


