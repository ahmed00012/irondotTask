class Features {
  String key;
  String value;

<<<<<<< HEAD
  Features({this.key, this.value});

  Features.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

}
=======
  Features.fromApi(data) {
    this.key = data['key'];
    this.value = data['value'];
  }
}
>>>>>>> 01f0c6b59806b76d7a4ec52297c1b2c0beda3d40
