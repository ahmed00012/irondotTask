import 'package:irondot_task/Models/FeaturesModel.dart';
import 'package:irondot_task/Models/ImagesModel.dart';
<<<<<<< HEAD
class Model {
  String id;
  String price;
  String name;
=======

class Model {
  String name;
  String price;
>>>>>>> 01f0c6b59806b76d7a4ec52297c1b2c0beda3d40
  String address;
  String numBed;
  String numBath;
  String numParking;
  String coverPhoto;
  String descrption;
<<<<<<< HEAD
  List<Features> features;
  List images;

  String img1;
  String img2;
  String img3;

  Model({this.id, this.price, this.name, this.address, this.numBed, this.numBath, this.numParking, this.coverPhoto, this.descrption, this.features,this.images, this.img1,this.img2,this.img3});

  Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
//    images = json['images'];

//    if(images != null){
//   print(images.length);
//    }



    if (json['features'] != null) {
      features = new List<Features>();
      json['features'].forEach((v) { features.add(new Features.fromJson(v)); });
    }

  }


=======
  List<Features> features = new List<Features>();
  List<String> images = new List<String>();

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
        Features.fromApi(listData),
      ),
    );

//    data['images']?.forEach(
//      (listData) => images.add(
//          this.images = data['images']
//      ),
//    );
  }
>>>>>>> 01f0c6b59806b76d7a4ec52297c1b2c0beda3d40
}
