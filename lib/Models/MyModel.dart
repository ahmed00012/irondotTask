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
  var images;

  Model({ this.price, this.name, this.address, this.numBed, this.numBath, this.numParking, this.coverPhoto, this.descrption, this.features,this.images,});

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





    if (json['features'] != null) {
      features = new List<Features>();
      json['features'].forEach((v) { features.add(new Features.fromJson(v)); });
    }

  }





}
