import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irondot_task/Models/MyModel.dart';
import 'package:irondot_task/WebService/ApiProvider.dart';
import 'package:irondot_task/pages/DetailsCard.dart';
import 'package:photo_view/photo_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Model> hotels = new List<Model>();
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

            itemBuilder: (context,index){
              return Container(

                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: hotels.map((e) => Card(
                      child: Hero(
                        tag: Text(e.name),

                        child:Container(
                            height: 150,
child: Row(
  children: <Widget>[
    Image.network(e.coverPhoto,fit: BoxFit.fitHeight,width: 200,),
    
    Padding(padding: EdgeInsets.only(right: 20)),
   InkWell(
     child:  Column(
       children: <Widget>[
         Padding(padding: EdgeInsets.only(top: 20)),
         Text(e.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
         Padding(padding: EdgeInsets.only(top: 50)),
         Row(
           children: <Widget>[
             Text("price: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.deepPurple),),
             Text(e.price,style: TextStyle(fontWeight: FontWeight.w500),)
           ],
         ),

       ],
     ),
     onTap:()=> Navigator.of(context).push( MaterialPageRoute(builder: (context)=> new DetailsCard())),
   )
    
  ],
),

                        ),


                      ),
                    )).toList()
                ),
              );

            }
        ),




    );



  }
}
