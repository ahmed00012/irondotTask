import 'package:irondot_task/Models/FeaturesModel.dart';


class Model {

  String name;
  String price;
  String address;
  String numBed;
  String numBath;
  String numParking;
  String coverPhoto;
  String descrption;
  List<Features> features;
  List images;

  

  Model.fromJson(Map<String, dynamic> json) {

    price = json['price'];
    name = json['name'];
    address = json['address'];
    numBed = json['numBed'];
    numBath = json['numBath'];
    numParking = json['numParking'];
    coverPhoto = json['coverPhoto'];
    descrption = json['descrption'];

     images= json['images'];
//    List<String> imgList = images1.cast<String>();
//    print(images1.first);
//    images = imgList;


    if (json['features'] != null) {
      features = new List<Features>();
      json['features'].forEach((v) { features.add(new Features.fromJson(v)); });
    }

  }



  Model.fromApi(data) {
    this.name = data['name'];
    this.price = data['price'];
    this.address = data['address'];
    this.numBed = data['numBed'];
    this.numBath = data['numBath'];
    this.numParking = data['numParking'];
    this.coverPhoto = data['coverPhoto'];
    this.descrption = data['description'];
this.images = data['images'].cast<String>();
    data['features']?.forEach(
      (listData) => features.add(
        Features.fromJson(listData),
      ),
    );

//    data['images']?.forEach(
//      (listData) => images.add(
//          this.images = data['images']
//      ),
//    );
  }

}
