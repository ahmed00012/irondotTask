
import 'package:carousel_slider/carousel_slider.dart';
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

  DetailsCard({this.name,
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



class _DetailsCardState extends State<DetailsCard> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
        title: Text(
          widget.name,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            height: 240,
            child: GridTile(
              child: Container(
                alignment: Alignment.topCenter,
                child: CarouselSlider(
                  height: 190,

                  enableInfiniteScroll: false,
                  items: <Widget>[
                    Image.network(widget.img1,),
                    Image.network(widget.img2),
                    Image.network(widget.img3),
                  ],
                ),
              ),
              footer: new Container(

                color: Colors.white,
                height: 60,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(5)),
                        Row(
                          children: <Widget>[
                            Text(
                              widget.address,
                              style: TextStyle(fontSize: 18),
                            ),
                            Padding(padding: EdgeInsets.only(right: 25)),
                            Text(
                              "Parking : ",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.deepPurple),
                            ),
                            Text(
                              widget.numParking,
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Row(
                          children: <Widget>[
                            Text(
                              "price :  ",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.deepPurple),
                            ),
                            Text(
                              widget.price,
                              style: TextStyle(fontSize: 16),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 50),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "Beds : ",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.deepPurple),
                                ),
                                Text(
                                  widget.numBed,
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(left: 60)),
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
                  "features",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 3, 10, 5),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          widget.features[0].key + " : ",
                          style:
                              TextStyle(fontSize: 16, color: Colors.deepPurple),
                        ),
                        Text(widget.features[0].value)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          widget.features[1].key + " : ",
                          style:
                              TextStyle(fontSize: 16, color: Colors.deepPurple),
                        ),
                        Text(widget.features[1].value)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          widget.features[2].key + " : ",
                          style:
                              TextStyle(fontSize: 16, color: Colors.deepPurple),
                        ),
                        Text(widget.features[2].value)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "description",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8,0, 8, 3),
            child: Text(
              widget.descrption,
              overflow: TextOverflow.clip,
              maxLines: 13,
              style: TextStyle(color: Colors.black45),
            ),
          )
        ],
      ),
    );

  }
}
