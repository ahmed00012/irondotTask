import 'package:irondot_task/Models/FeaturesModel.dart';
import 'package:irondot_task/Models/ImagesModel.dart';

class Model {
  String name;
  String price;
  String address;
  String numBed;
  String numBath;
  String numParking;
  String coverPhoto;
  String descrption;
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
}
