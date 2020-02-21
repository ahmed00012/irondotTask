//class Images {
//String img1;
//String img2;
//String img3;
//
//  Images({this.img1,this.img2,this.img3 });
//
//Images.fromJson(Map<String, dynamic> json) {
//  img1 = json['images'][0];
//  img2 = json['images'][1];
//  img3 = json['images'][2];
//}
//
//Map<String, dynamic> toJson() {
//  List<String> images ;
//  final Map<String, dynamic> data = new Map<String, dynamic>();
//  data['images']?.forEach(
//          (listData) => images.add(
//        Images.fromJson(listData).toString(),
//      ),
//  );
//
//  return images as Map;
//}
//}