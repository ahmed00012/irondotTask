import 'package:bottom_personalized_dot_bar/bottom_personalized_dot_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irondot_task/Models/MyModel.dart';
import 'package:irondot_task/WebService/ApiProvider.dart';
import 'package:irondot_task/pages/DetailsCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<Model> hotels = new List<Model>();
  List<String> urls;
  bool isLoading = true;

  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();
    getHotels();
  }

  void getHotels() async {
    hotels = await ApiProvider().getApi();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: Text(
                    "Discover",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: hotels.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(2),
                        child: Container(
                            child: Column(
                          children: hotels
                              .map(
                                (e) => Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  elevation: 3.0,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  new DetailsCard(
                                                    name: e.name,
                                                    price: e.price,
                                                    address:
                                                        e.address,
                                                    numBath:
                                                        e.numBath,
                                                    numBed:
                                                        e.numBed,
                                                    numParking: e.numParking,
                                                    descrption: e.descrption,
                                                    features:
                                                        e.features,
                                                    img1: urls[0],
                                                    img2: urls[1],
                                                    img3: urls[2],
                                                  )));

                                      String jh =
                                          e.images.toString();
                                      final urlRegExp = new RegExp(
                                          r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?");
                                      final urlMatches =
                                          urlRegExp.allMatches(jh);
                                      urls = urlMatches
                                          .map((urlMatch) => jh.substring(
                                              urlMatch.start, urlMatch.end))
                                          .toList();
                                      urls.forEach((x) => print(x));
                                    },
                                    child: Stack(
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Stack(
                                              children: <Widget>[
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      3.7,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10),
                                                    ),
                                                    child: Image.network(
                                                      "${e.coverPhoto}",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 6.0,
                                                  left: 6.0,
                                                  child: Card(
                                                    color: Colors.black45
                                                        .withOpacity(0.2),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(4.0),
                                                      child: Text(
                                                        " Furnitured ",
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 6.0,
                                                  left: 80.0,
                                                  child: Card(
                                                    color: Colors.black45
                                                        .withOpacity(0.2),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(4.0),
                                                      child: Text(
                                                        " Pet Friendly ",
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 7.0),
                                            Row(
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 15.0),
                                                  child: Container(
                                                    child: Text(
                                                      r"$ " + e.price,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            15, 3, 0, 0)),
                                                Text(
                                                  "Studio Apartment",
                                                  style: TextStyle(
                                                      color: Colors.black45,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 7.0),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15.0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Text(
                                                  "${e.address}",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 8, 0, 8),
                                              child: Divider(),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 30)),
                                                Image.asset(
                                                  'images/assets/bath.png',
                                                  color: Colors.blue,
                                                  height: 25,
                                                ),
                                                Text(
                                                  "  " + e.numBath + " Bath",
                                                  style: TextStyle(
                                                      color: Colors.black45,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 30)),
                                                Image.asset(
                                                    'images/assets/bed.png',
                                                    color: Colors.blue,
                                                    height: 25),
                                                Text(
                                                  "  " + e.numBed + " Bed",
                                                  style: TextStyle(
                                                      color: Colors.black45,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 30)),
                                                Image.asset(
                                                    'images/assets/car.png',
                                                    color: Colors.blue,
                                                    height: 25),
                                                Text(
                                                  "  " +
                                                      e.numParking +
                                                      " Parking",
                                                  style: TextStyle(
                                                      color: Colors.black45,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.0),
                                          ],
                                        ),
                                        Positioned(
                                            right: 20,
                                            bottom: 100,
                                            child: FlatButton(
                                                onPressed: null,
                                                hoverColor: Colors.black,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 15,
                                                  child: Icon(
                                                    Icons.send,
                                                    color: Colors.blue,
                                                    size: 16,
                                                  ),
                                                ))),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        )),
                      );
                    }),
              ],
            )),
      bottomNavigationBar: BottomAppBar(
        elevation: 4.0,
        child: Container(
          height: 40,
          child: Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1)),
              IconButton(
                  icon: Icon(
                    Icons.home,
                    color: Colors.blue,
                  ),
                  onPressed: null),
              Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.2)),
              IconButton(
                  icon: Icon(
                    Icons.chat,
                    color: Colors.blue,
                  ),
                  onPressed: null),
              Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.2)),
              IconButton(
                  icon: Icon(
                    Icons.face,
                    color: Colors.blue,
                  ),
                  onPressed: null),
            ],
          ),
        ),
      ),
    );
  }
}
