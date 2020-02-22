import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irondot_task/Models/MyModel.dart';
import 'package:irondot_task/WebService/ApiProvider.dart';
import 'package:irondot_task/pages/DetailsCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Model> hotels = new List<Model>();
  List<String> urls;
  bool isLoading = true;

  @override
  void initState() {
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
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
        title: Text(
          "Recent Hotels",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: hotels
                          .map((e) => Card(
                                child: Hero(
                                  tag: Text(e.name),
                                  child: Container(
                                    height: 150,
                                    child: Row(
                                      children: <Widget>[
                                        Image.network(
                                          e.coverPhoto,
                                          width: 200,
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(right: 20)),
                                        InkWell(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 20)),
                                                Text(
                                                  e.name,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 10)),
                                                Row(
                                                  children: <Widget>[
                                                    Text(
                                                      "Beds : ",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors
                                                              .deepPurple),
                                                    ),
                                                    Text(
                                                      e.numBed,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Text(
                                                      "Bathroom : ",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors
                                                              .deepPurple),
                                                    ),
                                                    Text(
                                                      e.numBath,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Text(
                                                      "Parking : ",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors
                                                              .deepPurple),
                                                    ),
                                                    Text(
                                                      e.numParking,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Text(
                                                      "price: ",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors
                                                              .deepPurple),
                                                    ),
                                                    Text(
                                                      e.price,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          new DetailsCard(
                                                            name: hotels[index]
                                                                .name,
                                                            price: hotels[index]
                                                                .price,
                                                            address:
                                                                hotels[index]
                                                                    .address,
                                                            numBath:
                                                                hotels[index]
                                                                    .numBath,
                                                            numBed:
                                                                hotels[index]
                                                                    .numBed,
                                                            numParking:
                                                                hotels[index]
                                                                    .numParking,
                                                            descrption:
                                                                hotels[index]
                                                                    .descrption,
                                                            features:
                                                                hotels[index]
                                                                    .features,
                                                            img1: urls[0],
                                                            img2: urls[1],
                                                            img3: urls[2],
                                                          )));

                                              String jh=hotels[index].images.toString();
                                              final urlRegExp = new RegExp(
                                                  r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?");
                                              final urlMatches = urlRegExp.allMatches(jh);
                                              urls = urlMatches.map(
                                                      (urlMatch) => jh.substring(urlMatch.start, urlMatch.end))
                                                  .toList();
                                              urls.forEach((x) => print(x));

                                            })
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                          .toList()),
                );
              }),
    );
  }
}
