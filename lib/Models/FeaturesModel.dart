class Features {
  String key;
  String value;

  Features({this.key, this.value});

  Features.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

}